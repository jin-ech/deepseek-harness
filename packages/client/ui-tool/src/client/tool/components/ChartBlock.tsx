/** ECharts renderer for generate_chart tool results. @module */
import { useEffect, useRef } from 'react'
import * as echarts from 'echarts'
import type { ChartCardModel } from '../models/chart-card-model.ts'
import css from './ChartBlock.module.css'

export interface ChartBlockProps {
  chart: ChartCardModel
}

/**
 * Render an interactive ECharts chart from a settled `generate_chart` result.
 * ECharts is statically imported and inlined into the client bundle by tsdown;
 * dynamic `import()` would produce a separate chunk that the DSH module loader
 * cannot resolve (it only knows module-table entries, not filesystem paths).
 */
export function ChartBlock({ chart }: ChartBlockProps) {
  const containerRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    const container = containerRef.current
    if (container === null) return

    const option = { ...chart.echarts_option } as Record<string, unknown>
    // The row summary already shows the chart title; strip it from the option
    // so ECharts does not render a duplicate that overlaps the legend/plot area.
    delete option.title
    // Ensure tooltip is enabled by default.
    if (option.tooltip === undefined) {
      option.tooltip = { trigger: chart.chart_type === 'pie' ? 'item' : 'axis' }
    }

    const instance = echarts.init(container)
    instance.setOption(option)

    const ro = new ResizeObserver(() => { instance.resize() })
    ro.observe(container)

    return () => {
      ro.disconnect()
      instance.dispose()
    }
  }, [chart])

  const width = chart.width ?? '100%'
  const height = chart.height ?? '400px'

  return (
    <div className={css.root}>
      <div
        ref={containerRef}
        className={css.canvas}
        style={{ width, height }}
      />
    </div>
  )
}
