-- =====================================================
-- SaaS Subscription & Churn Deep-Dive Analysis
-- Table Creation Script
-- =====================================================

-- Project Domain:
-- SaaS / Business Operations

-- Objective:
-- Create the primary churn analysis table
-- for customer subscription, service usage,
-- billing, and churn behavior analysis.

-- Dataset:
-- IBM Telco Customer Churn Dataset

-- =====================================================

-- =====================================================
-- Select Active Database
-- =====================================================

USE saas_churn_analysis;

-- =====================================================
-- Create Raw Customer Churn Table
-- =====================================================

CREATE TABLE telco_churn_raw (
    customerID VARCHAR(50),
    gender VARCHAR(20),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges FLOAT,
    TotalCharges VARCHAR(50),
    Churn VARCHAR(10)
);


-- =====================================================
-- Verify Table Structure
-- =====================================================

DESCRIBE telco_churn_raw;


-- =====================================================
-- Validate Imported Record Count
-- =====================================================

SELECT COUNT(*) AS total_rows
FROM telco_churn_raw;