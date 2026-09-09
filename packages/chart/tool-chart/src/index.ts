/**
 * ECharts chart generation tool for the DeepSeek Harness.
 *
 * When the model detects a chart-generation intent, it calls `generate_chart`
 * with a structured ECharts option object. The tool validates the option,
 * returns it as canonical JSON persisted on the result's presentation meta,
 * and the frontend renders it as an interactive chart using the ECharts
 * library.
 *
 * @module @deepseek-ai/dsh-tool-chart
 */

import type { Context } from '@deepseek-ai/cordis'
import z from '@deepseek-ai/schemastery'
import { defineTool } from '@deepseek-ai/dsh-tools'
import type { JsonValue } from '@deepseek-ai/dsh-util-values'

/** Stable Cordis plugin name shown in loader diagnostics. */
export const name = 'tool-chart'

/** Tool registry the `generate_chart` tool registers on. */
export const inject = ['tools']

/** No configuration needed — the tool is always active when mounted. */
export interface Config {
  /** Placeholder to satisfy the loader's config requirement. */
  _placeholder?: never
}

export const Config: z<Config> = z.object({})

/**
 * Chart data returned by the tool, persisted verbatim as the `tool/result`
 * presentation meta and consumed by frontend chart renderers.
 */
interface ChartPayload {
  title?: string
  chart_type: string
  echarts_option: Record<string, JsonValue>
  width?: string
  height?: string
}

/**
 * Register the `generate_chart` tool on `ctx.tools`.
 * @param ctx - registrant context carrying the tool registry.
 */
export function apply(ctx: Context): void {
  ctx.tools.register(defineTool({
    name: 'generate_chart',
    description:
      'Generate an interactive ECharts chart. Use this tool when the user asks '
      + 'for a chart, graph, visualization, or data plot. Provide a complete '
      + 'ECharts option object that describes the chart type, data, axes, '
      + 'legend, tooltip, and styling. Supported chart types include: line, '
      + 'bar, pie, scatter, radar, gauge, funnel, heatmap, treemap, sunburst, '
      + 'and more. The chart will be rendered interactively in the browser.',
    parameters: {
      title: {
        type: 'string',
        description: 'Chart title displayed at the top.',
      },
      chart_type: {
        type: 'string',
        required: true,
        enum: ['line', 'bar', 'pie', 'scatter', 'radar', 'gauge', 'funnel', 'heatmap', 'treemap', 'sunburst', 'candlestick', 'boxplot', 'sankey', 'graph', 'tree', 'parallel', 'themeRiver', 'custom'],
        description: 'The primary chart type.',
      },
      echarts_option: {
        type: 'object',
        required: true,
        additionalProperties: true,
        properties: {},
        description:
          'A complete ECharts option object (JSON). Must include at minimum '
          + '`series` (array of series definitions with `type` and `data`). '
          + 'Optionally include `title`, `tooltip`, `legend`, `xAxis`, `yAxis`, '
          + '`grid`, `color`, `backgroundColor`, etc. Follow the ECharts '
          + 'option specification exactly. Example for a bar chart: '
          + '{"tooltip":{"trigger":"axis"},"xAxis":{"type":"category","data":["Mon","Tue","Wed"]},'
          + '"yAxis":{"type":"value"},"series":[{"type":"bar","data":[120,200,150]}]}',
      },
      width: {
        type: 'string',
        description: 'CSS width for the chart container (e.g. "100%", "600px"). Defaults to "100%".',
      },
      height: {
        type: 'string',
        description: 'CSS height for the chart container (e.g. "400px"). Defaults to "400px".',
      },
    },
    output: {
      schema: {
        type: 'object',
        additionalProperties: false,
        properties: {
          title: { type: 'string' },
          chart_type: { type: 'string', required: true },
          echarts_option: { type: 'object', required: true, additionalProperties: true, properties: {} },
          width: { type: 'string' },
          height: { type: 'string' },
        },
      },
      render: (_args, value) => [{
        type: 'text',
        text: `Generated ${value.chart_type} chart`
          + (value.title ? `: ${value.title}` : '')
          + '.',
      }],
      /** Persist the canonical chart payload so UI bridges render the card on replay. */
      presentationMeta: (_args, value) => value,
    },
    execute(args) {
      // Validate that echarts_option has at least a series array
      const option = args.echarts_option as Record<string, JsonValue>
      if (!option || typeof option !== 'object') {
        throw new Error('echarts_option must be a valid JSON object')
      }
      if (!Array.isArray(option.series) || option.series.length === 0) {
        throw new Error('echarts_option must contain a non-empty "series" array')
      }
      // Ensure each series has a type
      for (const [i, s] of (option.series as unknown[]).entries()) {
        if (!s || typeof s !== 'object' || !('type' in (s as object))) {
          throw new Error(`echarts_option.series[${i}] must have a "type" field`)
        }
      }

      const result: ChartPayload = {
        chart_type: args.chart_type,
        echarts_option: option,
      }
      if (args.title !== undefined) result.title = args.title
      if (args.width !== undefined) result.width = args.width
      if (args.height !== undefined) result.height = args.height
      return Promise.resolve(result)
    },
    presentCall: args => ({
      card: 'generic',
      title: `生成${chartTypeLabel(args.chart_type)}图表`,
      kind: 'other',
      rawInput: args.title ?? args.chart_type,
    }),
    presentResult: (_args, result) => {
      const chart = chartFromMeta(result.meta)
      if (chart === undefined) return undefined
      return {
        card: 'generic',
        title: `${chartTypeLabel(chart.chart_type)}图表已生成`,
        kind: 'other',
        rawOutput: chart.title ?? chart.chart_type,
      }
    },
  }))
}

/**
 * Narrow a replayed `tool/result` presentation meta back to a chart payload.
 * @param meta - persisted presentation payload of one `generate_chart` call, if any.
 * @returns the chart payload, or undefined when meta is absent or malformed.
 */
function chartFromMeta(meta: JsonValue | undefined): ChartPayload | undefined {
  if (typeof meta !== 'object' || meta === null || Array.isArray(meta)) return undefined
  const { chart_type: chartType, echarts_option: option, title, width, height } = meta as Record<string, JsonValue>
  if (typeof chartType !== 'string') return undefined
  if (typeof option !== 'object' || option === null || Array.isArray(option)) return undefined
  return {
    chart_type: chartType,
    echarts_option: option as Record<string, JsonValue>,
    ...(typeof title === 'string' ? { title } : {}),
    ...(typeof width === 'string' ? { width } : {}),
    ...(typeof height === 'string' ? { height } : {}),
  }
}

/** Map chart type to Chinese label for UI display. */
function chartTypeLabel(type: string): string {
  const labels: Record<string, string> = {
    line: '折线',
    bar: '柱状',
    pie: '饼图',
    scatter: '散点',
    radar: '雷达',
    gauge: '仪表盘',
    funnel: '漏斗',
    heatmap: '热力',
    treemap: '矩形树',
    sunburst: '旭日',
    candlestick: 'K线',
    boxplot: '箱线',
    sankey: '桑基',
    graph: '关系',
    tree: '树形',
    parallel: '平行坐标',
    themeRiver: '主题河流',
    custom: '自定义',
  }
  return labels[type] ?? type
}
