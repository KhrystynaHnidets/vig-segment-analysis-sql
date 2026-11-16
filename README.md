# VIG 2025 segment analysis (SQL)

Small SQL project on Vienna Insurance Group's published 2025 results.

**Files**
- `vig_segment_analysis.sql`: creates three tables (`segment_results`, `segment_growth`, `group_results`) and loads the data.
- `queries.sql`: five analysis queries.

**Questions answered**
1. Which segment has the highest profit margin?
2. How much faster did profit grow than premiums in each segment?
3. Do the segments reconcile to the group figures?
4. Where is data missing?
5. What would +1 percentage point of margin add to profit in each segment?

**Main findings**
- Czech Republic has the highest margin (12.5%) and the best combined ratio (84.7%).
- Profit grew 4–6× faster than premiums in all four segments with growth data.
- Segment profit before tax reconciles exactly to the group (EUR 1,161.3m). Segment insurance revenue is EUR 1,146.7m higher than the group figure, which points to intra-group business removed in consolidation.
- +1 pp of margin in Extended CEE would add about EUR 39m of profit.

**Example result: profit margin by segment (query 1)**

| Segment | Margin % | Combined ratio |
|---|---|---|
| Czech Republic | 12.5 | 84.73 |
| Austria | 11.6 | 90.32 |
| Special Markets | 10.8 | 93.57 |
| Poland | 7.2 | 91.79 |
| Extended CEE | 6.0 | 91.32 |

**How to run:** paste both .sql files into any SQLite tool (e.g. sqliteonline.com or DB Browser for SQLite) and run them in order.

**Sources:** VIG Group Annual Report 2025; VIG preliminary results release, 12 March 2026. Margins are my own calculation.
