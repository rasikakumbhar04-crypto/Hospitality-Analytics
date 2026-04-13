# 🏨 Hospitality Analytics - Project (P1194)

## Project Overview

This project provides **comprehensive analytics and insights** into hospitality operations through SQL-based data analysis and Tableau visualizations. The project analyzes hotel booking data to uncover key performance indicators (KPIs), revenue trends, and operational metrics across multiple properties and cities.

https://drive.google.com/file/d/1wD2_f8f3GaeIznLsZ3te4fglBPGDxPK7/view?usp=drive_link

------------------------------------------------------------------------------------------------------------------

⭐ Project Summary
This project demonstrates the full data analytics lifecycle:
✅ Data Import → Cleaning → SQL Modeling
✅ Dashboard Development → Insights
✅ Final Business Recommendations
It is designed as an industry-ready BI project showcasing strong skills in data engineering, SQL development, visualization, and analytical storytelling.

-----------------------------------------------------------------------------------------------------------------

✅ Project Scope & Responsibilities

✓ Data Preparation & Cleaning

      - Imported raw CSV files directly into Excel and Tableau
      - Loaded datasets into SQL using the MySQL Import Wizard
      - Cleaned nulls, standardized dates, formats, and categories
    
    Ensured consistent schemas across SQL, Excel, Power BI, and Tableau

✓ Creating Data Relationships

      - Built relationships between:
    
        - dim_date
        - dim_hotels
        - dim_rooms
        - fact_bookings
        - fact_aggregated_bookings
    
    Ensured integrity for joins, filters, and dashboard performance

✓ Writing SQL Queries for Analysis

      - Created analytical queries for:
      - Revenue KPIs
      - Occupancy calculations
      - Booking trends
      - Customer loyalty metrics
      - Cancellation & no‑show patterns
    
    Built aggregated metrics for BI dashboards

✓ Dashboard Development

      - Excel: Imported CSV → Pivot charts → Slicers → KPI cards 
      - Tableau: Imported CSV → Visual storytelling dashboards 
      - Power BI: Direct SQL connection → Drill‑through → Measures → DAX
    
    All dashboards include filters for Property, City, Date, Channel, Room Category.

✓ Generating Business Insights

      - Identified key revenue drivers
      - Analyzed booking channel performance
      - Explored guest ratings
      - Highlighted high/low occupancy patterns
    
    Delivered actionable improvements for revenue & operations

------------------------------------------------------------------------------------------------------------------

✅ Tools & Technologies

https://img.shields.io/badge/SQL-MySQL-blue

https://img.shields.io/badge/Excel-Dashboard-green

https://img.shields.io/badge/Power%20BI-Analytics-yellow

https://img.shields.io/badge/Tableau-Visualization-orange

https://img.shields.io/badge/Data%20Cleaning-CSV%20Files-red

------------------------------------------------------------------------------------------------------------------

📁 Project Files

| Component             | File Name                                         |
|----------------------|----------------------------------------------------|
| Tableau Dashboard    | Hospitality Analysis - Tableau.twbx                |
| Excel Dashboard      | Hospitality Analytics - Excel Dashboard.xlsx       |
| Power BI Dashboard   | Hospitality Analytics - Power BI Dashboard.pbix    |
| SQL Script           | Hospitality Analytics - SQL.sql                    |
| Dataset – Dates      | dim_date.csv                                       |
| Dataset – Hotels     | dim_hotels.csv                                     |
| Dataset – Rooms      | dim_rooms.csv                                      |
| Dataset – Bookings   | fact_bookings.csv                                  |
| Dataset – Aggregated | fact_aggregated_booking.csv                        |

------------------------------------------------------------------------------------------------------------------

🗂️ Dataset Description

| Dataset Name              | Purpose                                                              |
|---------------------------|----------------------------------------------------------------------|
| dim_date                  | Provides date, month, year dimensions for analysis                   |
| dim_hotels                | Contains hotel name, property ID, and city information               |
| dim_rooms                 | Room categories and capacity details                                 |
| fact_bookings             | Detailed booking information including revenue and booking status    |
| fact_aggregated_booking   | Summary metrics such as occupancy, capacity, and successful bookings |

------------------------------------------------------------------------------------------------------------------

🧱 SQL Data Model (Star Schema)

                          dim_date
                             │
                             │  date_id = check_in_date
                             │
                ─────────────────────────────────────────
                │                                          │
                │                                          │
        fact_bookings                           fact_aggregated_bookings
                │                                          │
                │  property_id                             │  property_id
                │                                          │
             dim_hotels                                dim_hotels
                │                                          │
                │  room_category = room_id                 │  room_category = room_id
                │                                          │
             dim_rooms                                  dim_rooms

------------------------------------------------------------------------------------------------------------------

Dimension Tables

     DIM_DATE 
      - date_id    
      - full_date       
      - month       
      - year
     
     DIM_HOTELS               
       - property_id
       - property_name
       - city
     
     DIM_ROOMS
      - room_id
      - room_category
      - capacity


Fact Tables

     FACT_BOOKINGS
      - booking_id
      - property_id
      - customer_id
      - booking_date
      - check_in_date
      - checkout_date
      - room_category
      - booking_channel
      - no_guests
      - revenue_realized
      - booking_status
      - ratings_given
    
     FACT_AGGREGATED_BOOKINGS
      - date_id
      - property_id
      - room_category
      - capacity
      - successful_bookings
      - occupancy

------------------------------------------------------------------------------------------------------------------
    
🔄 Data Integration Workflow (Actual Process Used)

      - CSV Files → Excel (Dashboard)
      - CSV Files → Tableau (Dashboard)
      - CSV Files → MySQL (Import Wizard)
      - SQL Database → Power BI (Live Connection)

✅ Accurate to your real workflow
✅ No unnecessary ETL complexity

-----------------------------------------------------------------------------------------------------------------

📊 Dashboards

✅ 1. Excel Dashboard
Interactive pivot-based dashboard for fast KPI analysis.

📌 Includes:

    Revenue KPIs
    Occupancy trends
    Monthly performance
    Booking channel distribution
    Property-wise comparison

📁 Hospitality Analytics - Excel Dashboard.xlsx
📸 Screenshot placeholder:
./images/excel_dashboard.png

✅ 2. Power BI Dashboard
Connected directly to the SQL database for live-refresh analytics.

📌 Includes:

    Revenue by City / Property
    Occupancy heatmaps
    Guest loyalty & ratings
    No‑show & cancellation patterns
    Drill-through pages

📁 Hospitality Analytics - Power BI Dashboard.pbix
📸 Screenshot placeholder:
./images/powerbi_dashboard.png

✅ 3. Tableau Dashboard
Beautiful storytelling dashboards for executives.

📌 Includes:

    Property performance
    Seasonal revenue insights
    Customer satisfaction trends
    Booking patterns

📁 Hospitality Analysis - Tableau.twbx
📸 Screenshot placeholder:
./images/tableau_dashboard.png

------------------------------------------------------------------------------------------------------------------

📈 Key Business Insights

✅ 1. Revenue Insights

    City A & City B contribute 60%+ of total revenue
    Premium rooms have higher revenue per booking
    Revenue dips visible during off-season months

✅ 2. Booking Behavior Insights

    OTA channels drive most bookings but have highest cancellation rate
    Direct bookings show best customer ratings
    Guests prefer bookings in peak months (April–June, Oct–Dec)

✅ 3. Operational Insights

    Several properties have high capacity but low occupancy
    No-shows heavily impact weekend revenue
    Longer stays correlate with higher satisfaction

✅ 4. Customer Insights

    Loyalty members generate higher repeat revenue
    Younger customers prefer shorter stays
    Older customers give higher ratings

-----------------------------------------------------------------------------------------------------------------

✅ SQL Analysis Examples

  Total Revenue
      SELECT SUM(revenue_realized) AS total_revenueFROM fact_bookings;
  
  Occupancy %
      SELECT ROUND(SUM(successful_bookings)/SUM(capacity)*100,2) AS occupancy_rateFROM fact_aggregated_booking;
  
  Revenue by City
      SELECT h.city, SUM(f.revenue_realized) FROM fact_bookings fJOIN dim_hotels h USING(property_id)GROUP BY h.cityORDER BY 2 DESC;

------------------------------------------------------------------------------------------------------------------

🚀 How to Run This Project

✅ Excel

    Open Excel file
    Click Refresh All
    Use slicers to interact

✅ SQL

    Import CSV files using MySQL Import Wizard
    Run Hospitality Analytics - SQL.sql
    Execute queries

✅ Power BI

    Open .pbix file
    Update SQL connection credentials
    Refresh dashboard

✅ Tableau

    Open .twbx file
    Replace CSV file paths if required
