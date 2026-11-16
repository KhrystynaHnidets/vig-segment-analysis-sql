-- VIG 2025 segment analysis in SQL
-- Author: Khrystyna Hnidets | Data: VIG Group Annual Report 2025, VIG results release (12 March 2026)
-- Amounts in EUR thousand unless stated. Runs in SQLite, PostgreSQL or SQL Server (minor syntax changes).

-- 1. Tables ---------------------------------------------------------------
CREATE TABLE segment_results (
    segment                 TEXT PRIMARY KEY,
    fiscal_year             INTEGER,
    insurance_revenue       INTEGER,   -- insurance service revenue, EUR k
    profit_before_tax       INTEGER,   -- EUR k
    net_combined_ratio      REAL       -- %
);

CREATE TABLE segment_growth (           -- 2025 vs 2024, from the results release
    segment                 TEXT PRIMARY KEY,
    gwp_growth_pct          REAL,
    pbt_growth_pct          REAL,
    combined_ratio_change_pp REAL
);

CREATE TABLE group_results (
    fiscal_year             INTEGER PRIMARY KEY,
    gross_written_premiums  REAL,      -- EUR m
    insurance_revenue       REAL,      -- EUR m
    profit_before_tax       REAL,      -- EUR m
    net_combined_ratio      REAL       -- %
);

-- 2. Data -----------------------------------------------------------------
INSERT INTO segment_results VALUES
 ('Austria',         2025, 3747748,  434514, 90.32),
 ('Czech Republic',  2025, 2278664,  285618, 84.73),
 ('Poland',          2025, 1471768,  105695, 91.79),
 ('Extended CEE',    2025, 3907954,  236424, 91.32),
 ('Special Markets', 2025, 1170106,  126938, 93.57),
 ('Group Functions', 2025, 1766505,  -27872, 85.87);

INSERT INTO segment_growth VALUES
 ('Austria',          4.6, 29.3,  -2.2),
 ('Czech Republic',   8.2, 35.3, -10.1),
 ('Poland',          10.7, 62.5,  -3.8),
 ('Extended CEE',     9.2, 48.1,  NULL),
 ('Special Markets', NULL, NULL,  -5.1);

INSERT INTO group_results VALUES
 (2025, 16313.7, 13196.0, 1161.3, 90.1),
 (2024, 15226.3, 12138.5,  881.8, 93.4);
