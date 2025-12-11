# Retail Cross-Sell Intelligence Engine

# Project Overview
This project is an end-to-end Market Basket Analysis designed to identify cross-selling opportunities for a retail dataset. Unlike standard analyses that treat all customers equally, this project first **segments customers based on RFM behavior** before mining association rules.

**Goal:** Transform raw transaction logs into a targeted cross-sell strategy.

### 📊 Dashboard Preview
<img width="960" height="509" alt="Dashboard Preview Retail_Strategy" src="https://github.com/user-attachments/assets/dcec0fa7-6b6b-44dc-bfff-e4879f191f26" />



###  The Tech Stack
* **Python (Pandas):** ETL pipeline to clean and slice large datasets (~1M rows).
* **SQL (MySQL):** Customer segmentation using Window Functions and CTEs.
* **Machine Learning (mlxtend):** Association Rule Mining using the **FP-Growth Algorithm**.
* **Power BI:** Interactive dashboard for strategy visualization.

---

###  Key Insights
1.  **VIP vs. Standard Behavior:** High-value customers (VIPs) are driven by **"Occasion Buying"** (e.g., Champagne + Gifts), whereas Standard customers are driven by **"Utility Buying"** (e.g., Coffee + Sugar).
2.  **Hidden Gems:** Identified high-lift product pairs in the VIP segment that were invisible in the aggregate dataset due to low overall volume.
3.  **Strategic Shift:** Recommended moving from generic "Top Sellers" emails to segmented "Bundle Offers," targeting specific customer needs.

---

###  Repository Structure
* `segmentation_logic.sql` - The SQL scripts used for RFM analysis and customer labeling.
* `market_basket_analysis.ipynb` - The Python logic for the FP-Growth algorithm.
* `Retail_Strategy_Dashboard.pbix` - The Power BI file containing the final visuals.
* `dashboard_preview.png` - Snapshot of the final output.

---

###  Connect with Me
* [LinkedIn Profile](INSERT_YOUR_LINKEDIN_URL_HERE)
* [Portfolio Website](INSERT_YOUR_PORTFOLIO_URL_HERE)
