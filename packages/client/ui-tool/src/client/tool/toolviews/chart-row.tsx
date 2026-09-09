/** Keyed toolview for `generate_chart` — renders an interactive ECharts card. @module */
import type { Context } from '@deepseek-ai/cordis'
import { IconSparkle16 } from '@deepseek-ai/dsh-client-ui-primitives'
import type { PropsLocale } from '@deepseek-ai/dsh-client-ui-slots'
import type { ToolCallViewProps } from '../../contract/slots.ts'
import { toolRowModel } from '../models/tool-call-model.ts'
import { chartCardModel } from '../models/chart-card-model.ts'
import { ToolRow } from '../components/ToolRow.tsx'
import { CONVERSATION_NS as NS } from '../../locale.ts'

type ChartRowProps = ToolCallViewProps & PropsLocale<'conversation'>

/** Renders a generate_chart call with its interactive ECharts card. */
export function ChartRow({ toolName, block, inspect, t }: ChartRowProps) {
  const model = toolRowModel(toolName, block)
  const chart = chartCardModel(block)
  return (
    <ToolRow
      t={t}
      variant={model.variant}
      toolName={toolName}
      icon={<IconSparkle16 size={14} />}
      title={t('tool.title.chart')}
      summary={chart?.title ?? model.summary}
      bodyRaw={model.bodyRaw}
      output={model.output}
      errorSummary={model.errorSummary}
      state={model.state}
      inspect={inspect}
      chart={chart}
    />
  )
}

/** Registers the generate_chart conversation row. */
export const chartToolview = {
  name: 'chart-toolview',
  inject: ['slots'],
  apply(ctx: Context): void {
    ctx.slots.inject('tool.call.toolview', () =>
      ctx.slots.register({ name: 'tool.call.toolview', key: 'generate_chart', locale: NS }, ChartRow))
  },
}
