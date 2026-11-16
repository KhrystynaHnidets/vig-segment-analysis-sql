-- Q1. Profit margin by segment, ranked
SELECT segment,
       ROUND(100.0 * profit_before_tax / insurance_revenue, 1) AS margin_pct,
       net_combined_ratio
FROM segment_results
WHERE segment <> 'Group Functions'
ORDER BY margin_pct DESC;

-- Q2. Profit growth vs premium growth (how much faster profit grew)
SELECT segment, pbt_growth_pct, gwp_growth_pct,
       ROUND(pbt_growth_pct / gwp_growth_pct, 1) AS profit_to_premium_growth
FROM segment_growth
WHERE pbt_growth_pct IS NOT NULL AND gwp_growth_pct IS NOT NULL
ORDER BY profit_to_premium_growth DESC;

-- Q3. Reconciliation: do the segments add up to the group?
SELECT 'Insurance revenue' AS metric,
       ROUND(SUM(s.insurance_revenue) / 1000.0, 1) AS sum_of_segments_eur_m,
       g.insurance_revenue AS group_eur_m,
       ROUND(g.insurance_revenue - SUM(s.insurance_revenue) / 1000.0, 1) AS difference_eur_m
FROM segment_results s JOIN group_results g ON g.fiscal_year = s.fiscal_year
UNION ALL
SELECT 'Profit before tax',
       ROUND(SUM(s.profit_before_tax) / 1000.0, 1),
       g.profit_before_tax,
       ROUND(g.profit_before_tax - SUM(s.profit_before_tax) / 1000.0, 1)
FROM segment_results s JOIN group_results g ON g.fiscal_year = s.fiscal_year;

-- Q4. Data quality: which segments are missing growth data?
SELECT r.segment,
       CASE WHEN g.segment IS NULL THEN 'no growth row'
            WHEN g.gwp_growth_pct IS NULL OR g.pbt_growth_pct IS NULL THEN 'growth % missing'
            WHEN g.combined_ratio_change_pp IS NULL THEN 'combined ratio change missing'
            ELSE 'complete' END AS data_status
FROM segment_results r LEFT JOIN segment_growth g ON g.segment = r.segment
ORDER BY data_status, r.segment;

-- Q5. Scenario: profit impact of +1 percentage point margin in each segment (EUR m)
SELECT segment,
       ROUND(insurance_revenue * 0.01 / 1000.0, 1) AS extra_profit_eur_m
FROM segment_results
WHERE segment <> 'Group Functions'
ORDER BY extra_profit_eur_m DESC;
