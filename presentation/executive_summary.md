# Executive Summary
## SaaS Subscription & Churn Deep-Dive Analysis

---

# Business Problem

The VP of Growth identified a monthly customer churn rate of 6.5% but lacked visibility into:

- primary churn drivers,
- high-risk customer segments,
- revenue impact of churn,
- and potential gains from retention improvements.

The objective of this project was to analyze customer churn behavior using SQL, Python, statistical testing, and revenue modeling.

---

# Dataset Overview

- Dataset: IBM Telco Customer Churn Dataset
- Total Customers: 7,043
- Domain: SaaS / Business Operations

Key variables included:
- customer tenure,
- contract type,
- monthly charges,
- internet services,
- support services,
- and churn status.

---

# Key Business Findings

## 1. Month-to-Month Contracts Drive Highest Churn

Customers on month-to-month contracts demonstrated churn rates above 42%, significantly higher than annual contract customers.

This indicates low customer commitment and reduced retention stability.

---

## 2. Early Customer Lifecycle Is Highest Risk

Customers within the first 6 months showed churn rates exceeding 50%.

This suggests onboarding and early engagement challenges strongly influence churn behavior.

---

## 3. High Monthly Charges Increase Churn Risk

Customers with higher monthly charges churned significantly more frequently than lower-charge customers.

This may indicate pricing sensitivity or increased customer expectations.

---

## 4. Lack of Tech Support Correlates with Churn

Customers without technical support services churned at significantly higher rates.

Support accessibility appears strongly connected to customer retention.

---

## 5. Fiber Optic Customers Show Elevated Churn

Fiber optic customers demonstrated higher churn compared to DSL customers.

This may reflect pricing concerns, service expectations, or competitive alternatives.

---

# Statistical Validation

## Chi-Square Test

- Chi-Square Statistic: 1184.5966
- P-Value: < 0.001

Result:
Contract type and churn demonstrated a statistically significant relationship.

---

## Independent T-Test

- T-Statistic: 16.5367
- P-Value: < 0.001

Result:
Monthly charges differed significantly between churned and retained customers.

---

# Revenue Impact Analysis

- Estimated Monthly Revenue Lost to Churn: ₹139,130.85
- Estimated Annualized Revenue Loss: ₹1.67 Million+

A simulated 2% reduction in monthly churn demonstrated substantial customer retention improvements over a 12-month period.

Estimated annual revenue savings exceeded ₹700,000.

---

# Recommended Retention Strategies

## 1. Annual Contract Conversion Incentives
Encourage month-to-month customers to transition into long-term plans through discounts or bundled offers.

## 2. Structured Customer Onboarding
Implement onboarding programs during the first 90 days to improve customer engagement and product adoption.

## 3. Expanded Technical Support
Improve customer support accessibility for high-risk service segments.

## 4. Churn Monitoring System
Develop proactive churn-risk scoring models to identify at-risk customers early.

---

# Final Conclusion

The analysis successfully identified statistically validated churn drivers and quantified the financial impact of customer attrition.

Combining SQL analytics, Python visualization, statistical testing, and business modeling enabled actionable retention recommendations capable of reducing churn and improving SaaS revenue stability.