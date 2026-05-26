-- =====================================================
-- SaaS Subscription & Churn Deep-Dive Analysis
-- Data Cleaning & Validation Script
-- =====================================================

-- Domain:
-- SaaS / Business Operations

-- Objective:
-- Validate raw customer churn data, identify data quality
-- issues, and create a cleaned analysis-ready dataset.

-- Dataset:
-- IBM Telco Customer Churn Dataset

-- =====================================================



-- =====================================================
-- Validate Total Raw Dataset Records
-- =====================================================

SELECT COUNT(*) AS total_records
FROM telco_churn_raw;



-- =====================================================
-- Validate Customer ID Uniqueness
-- =====================================================

SELECT 
    COUNT(customerID) AS total_ids,
    COUNT(DISTINCT customerID) AS unique_ids
FROM telco_churn_raw;



-- =====================================================
-- Check Null Values Across Key Columns
-- =====================================================

SELECT
    SUM(CASE WHEN customerID IS NULL THEN 1 ELSE 0 END) AS customerID_nulls,
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END) AS gender_nulls,
    SUM(CASE WHEN tenure IS NULL THEN 1 ELSE 0 END) AS tenure_nulls,
    SUM(CASE WHEN MonthlyCharges IS NULL THEN 1 ELSE 0 END) AS monthly_nulls,
    SUM(CASE WHEN TotalCharges IS NULL THEN 1 ELSE 0 END) AS totalcharges_nulls,
    SUM(CASE WHEN Churn IS NULL THEN 1 ELSE 0 END) AS churn_nulls
FROM telco_churn_raw;



-- =====================================================
-- Identify Blank TotalCharges Values
-- =====================================================

SELECT COUNT(*) AS blank_totalcharges
FROM telco_churn_raw
WHERE TRIM(TotalCharges) = '';



-- =====================================================
-- Review Customers with Blank TotalCharges
-- =====================================================

SELECT customerID, tenure, MonthlyCharges, TotalCharges
FROM telco_churn_raw
WHERE TRIM(TotalCharges) = '';



-- =====================================================
-- Validate Distinct SeniorCitizen Values
-- =====================================================

SELECT DISTINCT SeniorCitizen
FROM telco_churn_raw;



-- =====================================================
-- Validate Distinct Contract Categories
-- =====================================================

SELECT DISTINCT Contract
FROM telco_churn_raw;



-- =====================================================
-- Validate Distinct Internet Service Categories
-- =====================================================

SELECT DISTINCT InternetService
FROM telco_churn_raw;



-- =====================================================
-- Validate Distinct Online Security Categories
-- =====================================================

SELECT DISTINCT OnlineSecurity
FROM telco_churn_raw;



-- =====================================================
-- Create Cleaned Customer Churn Table
-- =====================================================

CREATE TABLE telco_churn_clean AS

SELECT
    customerID,

    TRIM(gender) AS gender,

    -- Convert binary SeniorCitizen indicator into readable labels
    CASE
        WHEN SeniorCitizen = 1 THEN 'Yes'
        ELSE 'No'
    END AS SeniorCitizen,

    TRIM(Partner) AS Partner,
    TRIM(Dependents) AS Dependents,

    tenure,

    TRIM(PhoneService) AS PhoneService,
    TRIM(MultipleLines) AS MultipleLines,
    TRIM(InternetService) AS InternetService,
    TRIM(OnlineSecurity) AS OnlineSecurity,
    TRIM(OnlineBackup) AS OnlineBackup,
    TRIM(DeviceProtection) AS DeviceProtection,
    TRIM(TechSupport) AS TechSupport,
    TRIM(StreamingTV) AS StreamingTV,
    TRIM(StreamingMovies) AS StreamingMovies,

    TRIM(Contract) AS Contract,
    TRIM(PaperlessBilling) AS PaperlessBilling,
    TRIM(PaymentMethod) AS PaymentMethod,

    MonthlyCharges,

    -- Convert blank TotalCharges values into NULL
    CASE
        WHEN TRIM(TotalCharges) = '' THEN NULL
        ELSE CAST(TRIM(TotalCharges) AS DECIMAL(10,2))
    END AS TotalCharges,

    TRIM(Churn) AS Churn

FROM telco_churn_raw;



-- =====================================================
-- Verify Newly Created Clean Table
-- =====================================================

SHOW TABLES;



-- =====================================================
-- Validate Total Cleaned Records
-- =====================================================

SELECT COUNT(*) AS total_rows
FROM telco_churn_clean;



-- =====================================================
-- Review Clean Table Structure
-- =====================================================

DESCRIBE telco_churn_clean;



-- =====================================================
-- Validate Remaining NULL TotalCharges Values
-- =====================================================

SELECT COUNT(*) AS totalcharge_nulls
FROM telco_churn_clean
WHERE TotalCharges IS NULL;



-- =====================================================
-- Validate Cleaned SeniorCitizen Categories
-- =====================================================

SELECT DISTINCT SeniorCitizen
FROM telco_churn_clean;