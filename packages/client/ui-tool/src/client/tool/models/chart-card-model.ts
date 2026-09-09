/** Pure chart-card derivation from raw generate_chart result metadata. @module */
import type { ToolCallBlock } from './tool-call-model.ts'

/** Chart payload persisted by the `generate_chart` tool's presentationMeta. */
export interface ChartCardModel {
  title?: string
  chart_type: string
  echarts_option: Record<string, unknown>
  width?: string
  height?: string
}

/**
 * Narrow a settled `generate_chart` result's presentation meta to a chart card.
 * @param block - running or settled Tool block.
 * @returns the chart card model, or null when the block is not a settled
 *   `generate_chart` call with valid chart metadata.
 */
export function chartCardModel(block: ToolCallBlock): ChartCardModel | null {
  if (!('kind' in block) || block.isError) return null
  const meta = block.meta
  if (typeof meta !== 'object' || meta === null || Array.isArray(meta)) return null
  const record = meta as Record<string, unknown>
  const chartType = record.chart_type
  const option = record.echarts_option
  if (typeof chartType !== 'string') return null
  if (typeof option !== 'object' || option === null || Array.isArray(option)) return null
  const title = typeof record.title === 'string' ? record.title : undefined
  const width = typeof record.width === 'string' ? record.width : undefined
  const height = typeof record.height === 'string' ? record.height : undefined
  return {
    chart_type: chartType,
    echarts_option: option as Record<string, unknown>,
    ...(title !== undefined ? { title } : {}),
    ...(width !== undefined ? { width } : {}),
    ...(height !== undefined ? { height } : {}),
  }
}
