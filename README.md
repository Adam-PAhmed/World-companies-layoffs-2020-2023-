
# World Companies’ Layoffs (2020–2023)

## Summary:

An end-to-end analysis of company layoffs world wide between 2020 and 2023 from 52 countries and 31 different industries.

**Objective:** Identify trends in layoffs by funding stage and company size, and assess the impact of external events (e.g. COVID-19).

**Key Insight:** While 2020 saw +19K layoffs, the biggest increases occurred in 2023 by +53K, indicating more complex market dynamics than the pandemic alone..

## Tools:

- MySQL (data cleaning & exploratory data analysis)  
- Power BI (interactive dashboard & visualization)

## Data Description:

- **Scope:** Layoff records for vraity of companies in deffeinte industries worldwide  
- **Fields:**  
  - company name  
  - company stage (Seed, Series A–C, Post-IPO..etc)  
  - total layoffs  
  - total_funding  
  - layoff_percentage  

## Project Steps:

### 1. Data Cleaning (MySQL)

1. Removing duplicates: Dropped duplicate rows to ensure data accuracy.

2. Handling missing values: Removed records missing critical fields such as layoffs or funding, and layoff percentage.

3. Standardizing formats: Unified stage names (e.g., Seed, seed, SEED) into a single “Seed,” and corrected other text formatting.

4. Correcting data types: Formatted date fields to a standardized date format.

5. Creating a clean table: Saved the cleaned dataset into a new table for use in subsequent analysis and visualization.

### 2. Exploratory Data Analysis (MySQL):

- Calculated total layoffs per year and per stage  
- Calculated highest 5 layoffs for companies per year  
- Identified highest layoffs per company’s stage

### 3. Interactive Dashboard (Power BI)

- Time-series chart of annual layoffs (2020–2023)  
- Bar chart of average layoff percentage by stage  
- Stacked area chart of funding amount vs. layoffs  
- Slicers for countries

## Key Insights

1. **Seed-stage companies have the highest layoff ratios**  
   - Average layoff rate of 70% in 2022 and 2023—far above all other stages.

2. **Well-funded companies show greater resilience**  
   - Companies in Series A and later rounds have layoff rates below 38%.

3. **COVID-19 did not uniformly drive layoffs**  
   - While 2020 saw +19K layoffs, the biggest increases occurred in 2023 by +53K, indicating more complex market dynamics than the pandemic alone.
