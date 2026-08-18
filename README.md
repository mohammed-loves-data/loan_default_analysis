# Loan Default Analysis

## Project Overview 

This data analysis project aims to provide insights into the factors that drive loan defaults, By analyzing various
aspects of the loan data, we seek to understand trends, make data-driven recommendations and gain deeper understanding to factors 
associated with loan defaults.

### Data Sources

loan_data: The primary data set used  for the analysis is the "loan_data.csv" file, containing detailed information about each loan.

### Tools 
- SQL - Data Cleaning & Analysis
- Power BI - Creating reports

### Data Cleaning/Preparation 

In the initial data preparation phase, we performed the following tasks:
- Data loading and inspection
- Standardized table names for easier analysis 

### Exploratory Data Analysis 

EDA Involved exploring the loan data to answer key questions, such as:

- What loan purpose has the highest default rate?
- What employment type has the highest default?
- Does interest rate affect default rate?

### Data Analysis

Interesting code I worked with:

```sql
SELECT 
	CASE
		WHEN interest_rate BETWEEN 5 AND 10 THEN '5%-10%'
        WHEN interest_rate BETWEEN 10 AND 15 THEN '10%-15%'
        WHEN interest_rate BETWEEN 15 AND 20 THEN '15%-20%'
        WHEN interest_rate BETWEEN 20 AND 25 THEN '20%-25%'
	ELSE '25%+'
		END AS interest_rate_band,
        SUM(defaults) AS total_defaults,
        AVG(defaults) AS default_rate,
        COUNT(defaults) AS no_of_default
        FROM loan_default
        GROUP BY interest_rate_band
        ORDER BY interest_rate_band ASC;
```

### Results/Findings 

The analysis results are summarized as follows:
1. We observed that higher DTI ratios were associated with higher default rates, with "High risk" having the highest default rates.
   
   NOTE: When reviewing the data keep in mind, consider the differences in sample sizes, as they may affect the observed default rates

2. We observed that among loan purposes education has the highest default rates and total defaults of all loan purposes
  
3. We used the FICO score to measure credit risk by creating a credit band and to observe that borrowers with poor or "High risk" credit score had higher default rates of 12.60% and higher loan defaults of 46.
   
   NOTE: When reviewing the data keep in mind, consider the differences in sample sizes, as they may affect the observed default rates
   
4. We observed that the higher interest rates have significant amounts of defaults and default rates with "20%-25%" interest rates having  24 total defaults and 16.11% default rates.

5. We also analyzed:
   - Different levels of education with "Bachelor's" having the highest default rate of 15.26%.
   - Employment types with "Part time" having the highest default rate of 14.19%.
   - Marital status with "Divorced" having the highest default rate at 13.28%

### Recommendations

Based on the analysis we recommend the following actions:
- There should be stricter checks on borrower risk assessment, using DTI ratio and credit scores as benchmark before handing out loans.
- There should be stronger monitoring and risk assessment for education loans, which recorded the highest default rates and total number of defaults among loan-purpose category analyzed.
- Review loan pricing and risk assessment practices for higher interest rate loans.

### Limitations

- Sample Size: Differences in sample sizes across categories may affect the observed default rates and should be considered when comparing groups.
- The analysis identifies associations and patterns in the available data but does not establish a causation.



