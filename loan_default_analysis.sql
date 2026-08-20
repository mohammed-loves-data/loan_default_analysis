-- Preview Dataset
SELECT *
FROM loan_default;

-- Cleaned data using CREATE TABLE for easy analysis
CREATE TABLE loan_default (
loan_id VARCHAR(10),
age INT,
income INT,
loan_amount INT,
credit_score INT,
months_employed INT,
num_credit_lines INT,
interest_rate DEC(10,2),
loan_term INT,
dti_ratio DEC(10,2),
education VARCHAR(12),
employment_type  VARCHAR(13),
marital_status VARCHAR(8),
has_mortgage VARCHAR(3),
has_dependents VARCHAR(3),
loan_purpose VARCHAR(10),
has_co_signer VARCHAR (3),
defaults INT
);

-- Analyze default risk across different interest rate band
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
	
-- Used CASE Statement to properly arrange the interest rate band for better readability
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
        COUNT(*) AS total_loans
        FROM loan_default
        GROUP BY interest_rate_band
        ORDER BY 
			CASE
				WHEN interest_rate_band = '5%-10%' THEN 1
                WHEN interest_rate_band = '10%-15%' THEN 2
                WHEN interest_rate_band = '15%-20%' THEN 3
                WHEN interest_rate_band = '20%-25%' THEN 4
                ELSE 5
			END;

-- Analyze default risk across different levels of education 
SELECT 
	education,
	AVG(defaults) AS default_rate,
    SUM(defaults) AS total_defaults,
    COUNT(*) AS total_loans
FROM loan_default
GROUP BY education
ORDER BY default_rate DESC; 

-- Analyze default risk across different employment types
SELECT 
	employment_type,
	AVG(defaults) AS default_rate,
	SUM(defaults) AS total_defaults,
	COUNT(*) AS total_loans
FROM loan_default
GROUP BY employment_type
ORDER BY default_rate DESC; 


-- Analyze default risk across different types of marital status 
SELECT 
	marital_status,
	AVG(defaults) AS default_rate,
	SUM(defaults) AS total_defaults,
	COUNT(*) AS total_loans
FROM loan_default
GROUP BY marital_status
ORDER BY default_rate DESC;

-- Analyze default risk across different types of loan purposes       
SELECT 
loan_purpose, 
AVG(defaults) AS default_rate, 
SUM(defaults) AS total_defaults, 
COUNT(*) AS total_loans 
FROM loan_default
GROUP BY loan_purpose
ORDER BY default_rate DESC;

-- Analyze default risk across different credit band  
SELECT 
    CASE
        WHEN credit_score BETWEEN 300 AND 579 THEN 'High risk'
        WHEN credit_score BETWEEN 580 AND 669 THEN 'Subprime'
        WHEN credit_score BETWEEN 670 AND 739 THEN 'Acceptable'
        WHEN credit_score BETWEEN 740 AND 799 THEN 'Highly reliable'
        WHEN credit_score BETWEEN 800 AND 850 THEN 'Low risk'
    END AS credit_band,
    AVG(defaults) AS default_rate,
    AVG(interest_rate) AS avg_interest_rate,
    SUM(defaults) AS total_defaults,
    COUNT(*) AS total_loans
FROM
    loan_default
GROUP BY credit_band
ORDER BY CASE
    WHEN credit_band = 'High risk' THEN 1
    WHEN credit_band = 'Subprime' THEN 2
    WHEN credit_band = 'Acceptable' THEN 3
    WHEN credit_band = 'Highly reliable' THEN 4
    ELSE 5
END;
    

-- Analyze loan default risk across Debt-to-income (DTI) ratio bands 
 SELECT
	CASE
		WHEN dti_ratio BETWEEN 0 AND 0.35 THEN 'Excellent'
        WHEN dti_ratio BETWEEN 0.36 AND 0.43 THEN 'Acceptable'
        WHEN dti_ratio BETWEEN 0.44 AND 0.50 THEN 'High risk'
        ELSE 'Critical'
	END  AS dti_ratio_band,
    AVG(defaults)  AS default_rates,
    SUM(defaults)  AS total_defaults,
    COUNT(*) AS total_loans
FROM loan_default
GROUP BY dti_ratio_band
ORDER BY 
    CASE
		WHEN dti_ratio_band = 'Critical' THEN 1
        WHEN dti_ratio_band = 'High risk' THEN 2
        WHEN dti_ratio_band = 'Acceptable' THEN 3
        WHEN dti_ratio_band = 'Excellent' THEN 4
END;    









    








