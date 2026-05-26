-- =====================================================
-- REVENUE ANALYSIS QUERIES
-- Project: SaaS Subscription & Churn Deep-Dive
-- =====================================================


-- =====================================================
-- 1. Monthly Revenue Lost Due to Churn
-- =====================================================

SELECT
    ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_lost
FROM telco_churn_clean
WHERE Churn = 'Yes';



-- =====================================================
-- 2. Revenue Comparison: Churned vs Retained Customers
-- =====================================================

SELECT
    Churn,
    
    COUNT(*) AS total_customers,
    
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_revenue,
    
    ROUND(SUM(MonthlyCharges), 2) AS total_monthly_revenue

FROM telco_churn_clean

GROUP BY Churn;



-- =====================================================
-- 3. ARPU Comparison (Average Revenue Per User)
-- =====================================================

SELECT
    Churn,
    
    ROUND(AVG(MonthlyCharges), 2) AS arpu

FROM telco_churn_clean

GROUP BY Churn;



-- =====================================================
-- 4. Revenue Impact by Contract Type
-- =====================================================

SELECT
    Contract,
    
    COUNT(*) AS total_customers,
    
    ROUND(AVG(MonthlyCharges), 2) AS avg_revenue_per_customer,
    
    ROUND(SUM(MonthlyCharges), 2) AS total_revenue,
    
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN MonthlyCharges ELSE 0 END),
        2
    ) AS churned_revenue

FROM telco_churn_clean

GROUP BY Contract

ORDER BY churned_revenue DESC;



-- =====================================================
-- 5. High-Value Customers at Churn Risk
-- =====================================================

SELECT
    customerID,
    Contract,
    InternetService,
    MonthlyCharges,
    tenure

FROM telco_churn_clean

WHERE Churn = 'Yes'
AND MonthlyCharges > 90

ORDER BY MonthlyCharges DESC;