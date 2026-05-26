-- =====================================================
-- SaaS Subscription & Churn Deep-Dive Analysis
-- Customer Churn Analysis Queries
-- =====================================================

-- Domain:
-- SaaS / Business Operations

-- Objective:
-- Analyze customer churn behavior across
-- contracts, tenure groups, revenue segments,
-- services, and customer risk categories.

-- Dataset:
-- IBM Telco Customer Churn Dataset

-- =====================================================



-- =====================================================
-- Overall Customer Churn Rate
-- =====================================================

SELECT 
    COUNT(*) AS total_customers,

    SUM(CASE 
            WHEN Churn = 'Yes' THEN 1 
            ELSE 0 
        END) AS churned_customers,

    ROUND(
        100.0 * SUM(CASE 
                        WHEN Churn = 'Yes' THEN 1 
                        ELSE 0 
                    END) / COUNT(*),
        2
    ) AS churn_rate_percentage

FROM telco_churn_clean;



-- =====================================================
-- Customer Distribution by Churn Status
-- =====================================================

SELECT 
    Churn,
    COUNT(*) AS customers,
    
    ROUND(
        100.0 * COUNT(*) / (
            SELECT COUNT(*) 
            FROM telco_churn_clean
        ),
        2
    ) AS percentage

FROM telco_churn_clean

GROUP BY Churn;



-- =====================================================
-- Churn Rate by Contract Type
-- =====================================================

SELECT
    Contract,

    COUNT(*) AS total_customers,

    SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) AS churned_customers,

    ROUND(
        100.0 * SUM(CASE
                        WHEN Churn = 'Yes' THEN 1
                        ELSE 0
                    END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_churn_clean

GROUP BY Contract

ORDER BY churn_rate DESC;


-- =====================================================
-- Revenue Comparison by Churn Status
-- =====================================================

SELECT
    Churn,

    COUNT(*) AS customers,

    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,

    ROUND(SUM(MonthlyCharges), 2) AS total_monthly_revenue

FROM telco_churn_clean

GROUP BY Churn;



-- =====================================================
-- Monthly Revenue Lost Due to Churn
-- =====================================================

SELECT
    ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_lost

FROM telco_churn_clean

WHERE Churn = 'Yes';



-- =====================================================
-- Churn Analysis by Customer Tenure Group
-- =====================================================

SELECT
    CASE
        WHEN tenure <= 6 THEN '0-6 Months'
        WHEN tenure <= 12 THEN '6-12 Months'
        WHEN tenure <= 24 THEN '1-2 Years'
        ELSE '2+ Years'
    END AS tenure_bucket,

    COUNT(*) AS total_customers,

    SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) AS churned_customers,

    ROUND(
        100.0 * SUM(CASE
                        WHEN Churn = 'Yes' THEN 1
                        ELSE 0
                    END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_churn_clean

GROUP BY tenure_bucket

ORDER BY churn_rate DESC;



-- =====================================================
-- Churn Analysis by Monthly Charge Segment
-- =====================================================

SELECT
    CASE
        WHEN MonthlyCharges < 35 THEN 'Low Charges'
        WHEN MonthlyCharges < 75 THEN 'Medium Charges'
        ELSE 'High Charges'
    END AS charge_bucket,

    COUNT(*) AS total_customers,

    SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) AS churned_customers,

    ROUND(
        100.0 * SUM(CASE
                        WHEN Churn = 'Yes' THEN 1
                        ELSE 0
                    END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_churn_clean

GROUP BY charge_bucket

ORDER BY churn_rate DESC;



-- =====================================================
-- Churn Rate by Internet Service Type
-- =====================================================

SELECT
    InternetService,

    COUNT(*) AS total_customers,

    SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) AS churned_customers,

    ROUND(
        100.0 * SUM(CASE
                        WHEN Churn = 'Yes' THEN 1
                        ELSE 0
                    END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_churn_clean

GROUP BY InternetService

ORDER BY churn_rate DESC;



-- =====================================================
-- Churn Rate by Payment Method
-- =====================================================

SELECT
    PaymentMethod,

    COUNT(*) AS total_customers,

    SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) AS churned_customers,

    ROUND(
        100.0 * SUM(CASE
                        WHEN Churn = 'Yes' THEN 1
                        ELSE 0
                    END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_churn_clean

GROUP BY PaymentMethod

ORDER BY churn_rate DESC;



-- =====================================================
-- Churn Rate by Tech Support Usage
-- =====================================================

SELECT
    TechSupport,

    COUNT(*) AS total_customers,

    SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) AS churned_customers,

    ROUND(
        100.0 * SUM(CASE
                        WHEN Churn = 'Yes' THEN 1
                        ELSE 0
                    END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_churn_clean

GROUP BY TechSupport

ORDER BY churn_rate DESC;



-- =====================================================
-- High-Risk Customer Segment Analysis
-- =====================================================

SELECT
    Contract,
    TechSupport,
    InternetService,

    COUNT(*) AS total_customers,

    SUM(CASE
            WHEN Churn = 'Yes' THEN 1
            ELSE 0
        END) AS churned_customers,

    ROUND(
        100.0 * SUM(CASE
                        WHEN Churn = 'Yes' THEN 1
                        ELSE 0
                    END) / COUNT(*),
        2
    ) AS churn_rate

FROM telco_churn_clean

GROUP BY
    Contract,
    TechSupport,
    InternetService

HAVING total_customers >= 50

ORDER BY churn_rate DESC;