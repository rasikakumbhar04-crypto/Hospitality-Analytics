# 🏨 Hospitality Analytics - Project (P1194)

## Project Overview

This project provides **comprehensive analytics and insights** into hospitality operations through SQL-based data analysis and Tableau visualizations. The project analyzes hotel booking data to uncover key performance indicators (KPIs), revenue trends, and operational metrics across multiple properties and cities.

![Hospitality Analytics Banner](./images/banner.png)

### 📊 Key Highlights
- **Multi-property hotel analytics** across various cities
- **Real-time revenue tracking** and financial performance monitoring
- **Guest behavior analysis** including ratings, loyalty, and booking patterns
- **Operational insights** on occupancy rates, cancellations, and no-shows
- **Interactive Tableau dashboards** for executive-level decision making

## Project Contents

### 1. **Hospitality Analytics - SQL.sql**
   SQL queries and schema definitions for the hospitality database. Includes:
   - Database and table creation
   - Dimension tables (dates, hotels, rooms)
   - Fact tables (aggregated bookings, detailed bookings)
   - Pre-built analysis queries

### 2. **Hospitality Analysis - Tableau.twbx**
   Tableau workbook containing interactive dashboards and visualizations for hospitality metrics

## Database Architecture

### Entity Relationship Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                    DIMENSION TABLES                          │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  DIM_DATE              DIM_HOTELS            DIM_ROOMS      │
│  ├─ date_id            ├─ property_id        ├─ room_id     │
│  ├─ full_date          ├─ property_name      ├─ room_cat    │
│  ├─ month              ├─ city               └─ capacity    │
│  └─ year               └─ ...                               │
│                                                               │
└─────────────────────────────────────────────────────────────┘
                             ▲
                 ┌───────────┼───────────┐
                 │           │           │
                 ▼           ▼           ▼
        ┌──────────────┬─────────────┬───────────────┐
        │  FACT_BOOKINGS  │  FACT_AGGREGATED_BOOKINGS│
        ├──────────────┼─────────────┼───────────────┤
        │ • booking_id │ • date_id   │ • property_id │
        │ • property_id│ • property_id│ • room_cat  │
        │ • customer_id│ • capacity  │ • successful │
        │ • revenue    │ • occupancy │   _bookings  │
        │ • ratings    │ • metrics   │ • capacity   │
        └──────────────┴─────────────┴───────────────┘
```

### 📈 Data Flow & Analytics Pipeline

```
RAW DATA
   │
   ▼
┌──────────────────────────┐
│   SQL Database           │
│  (Dimension + Fact       │
│   Tables)                │
└──────────────────────────┘
   │
   ├─────────────────────────┬────────────────────────┐
   │                         │                        │
   ▼                         ▼                        ▼
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│  SQL Queries │    │SQL Analytics │    │   Further    │
│   (KPIs)     │    │   Reports    │    │ Aggregations │
└──────────────┘    └──────────────┘    └──────────────┘
   │                         │                        │
   └─────────────────────────┼────────────────────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ Tableau Workbook │
                    │  (Dashboards &   │
                    │ Visualizations)  │
                    └──────────────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │ Executive Reports│
                    │   & Insights     │
                    └──────────────────┘
```

### Key Data Fields

**FACT_BOOKINGS** includes:
- `booking_id`, `property_id`, `customer_id`
- `booking_date`, `check_in_date`, `checkout_date`
- `room_category`, `booking_platform`, `booking_channel`
- `no_guests`, `stay_duration`
- `revenue_generated`, `revenue_realized`
- `booking_status` (Checked Out, Cancelled, No Show)
- `ratings_given`, `discount_applied`
- `country`, `customer_age`, `special_requests`
- `is_loyalty_member`, `payment_method`
- `cancellation_reason`

## Key Metrics & Analytics Dashboard

### 📊 Revenue Analytics

![Revenue Metrics Dashboard](./images/revenue-dashboard.png)

**Sample Revenue Metrics:**
- **Total Revenue**: Multi-million dollar revenue across all properties
- **Revenue Breakdown**:
  - By City (Top cities' contribution)
  - By Property (Property-wise performance)
  - By Month (Seasonal trends visualization)

```
Sample Monthly Revenue Trend:
│
│     ┌─────┐
│     │     │        ┌─────┐
│  ┌──┤     │    ┌───┤     │
│  │  │     │    │   │     │
└──┴──┴─────┴────┴───┴─────┴─────────► Months
   Jan Feb Mar Apr May Jun ...
```

### 📋 Booking Analytics

![Booking Metrics](./images/booking-metrics.png)

**Key Booking Indicators:**
- **Total Bookings**: Overall booking volume
- **Successful Bookings**: "Checked Out" status
- **Cancellation Rate**: % of cancelled bookings
- **No-Show Rate**: Guest no-show percentage
- **Monthly Booking Trends**: Seasonal patterns

| Metric | Description |
|--------|-------------|
| Total Bookings | Count of all booking records |
| Successful Rate | Percentage of completed stays |
| Cancellation Rate | % of cancelled bookings |
| No-Show Rate | % of guests who didn't arrive |

### ⭐ Guest Experience Metrics

![Guest Satisfaction](./images/guest-satisfaction.png)

- **Average Rating**: Customer satisfaction score
- **Loyalty Program Impact**: Loyalty member booking patterns
- **Repeat Booking Rate**: Guest retention metrics

### 🏢 Property Performance

![Property Performance](./images/property-performance.png)

**City-wise Breakdown:**
- Total bookings per city
- Revenue contribution per city
- Occupancy rates by property
- Performance rankings

### 🏨 Occupancy & Capacity Metrics

```
OCCUPANCY RATE VISUALIZATION:

Property A: ████████░░ 80%
Property B: ███████░░░ 70%
Property C: █████████░ 90%
Property D: ██████░░░░ 60%

Average: ████████░░ 75%
```



## 🚀 Setup & Deployment

### Prerequisites
- **MySQL** 5.7+ or compatible database server
- **Tableau Desktop** 2021+ or **Tableau Server** for accessing `.twbx` files
- Sufficient storage for hotel booking dataset
- Database user with CREATE/INSERT/SELECT permissions

### Installation Steps

#### Step 1️⃣: Database Setup
```sql
-- Create and initialize database
-- Run the complete Hospitality Analytics - SQL .sql file
```

#### Step 2️⃣: Data Loading
```sql
-- Enable local file import (if using CSV/local data)
SET GLOBAL local_infile=on;

-- Load data into fact and dimension tables
-- (Use your data source - CSV, API, or direct inserts)
```

#### Step 3️⃣: Verify Installation
```sql
-- Verify tables are created
SHOW TABLES;

-- Check record counts
SELECT COUNT(*) FROM fact_bookings;
SELECT COUNT(*) FROM fact_aggregated_bookings;
```

#### Step 4️⃣: Open Tableau Dashboard
```
1. Open Tableau Desktop or Tableau Server
2. Load "Hospitality Analysis - Tableau .twbx"
3. Refresh data connections
4. Explore pre-built dashboards
```

### 🔄 Architecture Overview

![System Architecture](./images/system-architecture.png)

```
┌─────────────────────────────────────────────────────────┐
│                    DATA SOURCES                          │
│          (Booking Systems, APIs, CSV Files)              │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
            ┌────────────────────┐
            │   MySQL Database   │
            │                    │
            │ • dim_date         │
            │ • dim_hotels       │
            │ • dim_rooms        │
            │ • fact_bookings    │
            │ • fact_aggregated  │
            └────────────────┬───┘
                     │
            ┌────────┴────────┐
            │                 │
            ▼                 ▼
      ┌──────────┐      ┌────────────┐
      │SQL       │      │  Tableau   │
      │Queries & │      │ Dashboards │
      │Reports   │      │            │
      └──────────┘      └────────────┘
            │                 │
            └────────┬────────┘
                     ▼
            ┌─────────────────────┐
            │  Executive Reports  │
            │  & KPI Dashboards   │
            └─────────────────────┘
```

## 📊 Pre-built Analytics Queries

### 💰 Revenue Queries
```sql
-- Total Revenue All Properties
SELECT sum(revenue_realized) as Total_Revenue FROM Fact_bookings;

-- Revenue by City
SELECT T2.City, SUM(T1.revenue_realized) as Total_Revenue 
FROM fact_bookings T1
JOIN dim_hotels T2 ON T1.property_id=T2.property_id 
GROUP BY T2.City ORDER BY Total_Revenue DESC;

-- Revenue by Property
SELECT T2.Property_name, SUM(T1.revenue_realized) as TotalRevenue 
FROM fact_bookings T1
JOIN dim_hotels T2 ON T1.property_id=T2.property_id 
GROUP BY T2.property_name;
```

### 📈 Occupancy & Performance Queries
```sql
-- Occupancy Rate
SELECT ROUND(SUM(successful_bookings) / SUM(capacity) * 100, 2) 
AS occupancy_percentage
FROM fact_aggregated_bookings;

-- Monthly Booking Trends
SELECT DATE_FORMAT(T1.check_in_date, '%Y-%m') AS booking_month,
    COUNT(T1.booking_id) AS TotalBookings
FROM fact_bookings T1
GROUP BY booking_month ORDER BY booking_month;
```

### ⭐ Guest Experience Queries
```sql
-- Average Guest Rating
SELECT AVG(ratings_given) as Avg_Rating 
FROM fact_bookings 
WHERE ratings_given IS NOT NULL;

-- Cancellation Analysis
SELECT 
    COUNT(booking_id) AS Total_Cancelled,
    ROUND((COUNT(CASE WHEN booking_status = 'Cancelled' THEN 1 END) * 100.0 / COUNT(*)), 2) 
    AS Cancelled_Percentage
FROM fact_bookings;
```

### 📹 Dashboard Examples

#### Revenue Dashboard
![Revenue Analysis Dashboard](./images/tableau-revenue-dashboard.png)

#### Occupancy Analytics
![Occupancy Dashboard](./images/tableau-occupancy-dashboard.png)

#### Guest Satisfaction Dashboard
![Guest Satisfaction Dashboard](./images/tableau-guest-dashboard.png)

#### Property Performance Dashboard
![Property Performance Dashboard](./images/tableau-property-dashboard.png)

## 💡 Key Business Insights

## 💡 Key Business Insights

### 🎯 Revenue Optimization
- Identify high-performing properties and markets
- Track seasonal revenue patterns
- Optimize pricing strategies based on occupancy trends
- Analyze discount impact on revenue

### 📊 Operational Excellence
- Monitor occupancy rates across properties
- Identify cancellation patterns and reasons
- Track no-show rates by property and booking channel
- Optimize room utilization

### 👥 Guest Experience
- Monitor average ratings trends
- Analyze loyalty program effectiveness
- Identify high-value customer segments
- Track customer satisfaction by property

### 📱 Channel Performance
```
BOOKING CHANNEL ANALYSIS:

Direct Bookings:   ███████░░░░ 35%
OTA (Partner):     ███████████ 50%
Loyalty Program:   ██░░░░░░░░ 15%
```

## 🛠️ Advanced Usage

### Creating Custom Dashboards in Tableau
1. Connect to MySQL database using the saved connection
2. Create new worksheets using tables from the database
3. Drag dimensions (Date, City, Property) to shelf
4. Add measures (Revenue, Bookings) for analysis
5. Combine worksheets into interactive dashboards

### Extending SQL Analysis
- Add new calculated fields for specific business needs
- Create views for commonly used queries
- Build stored procedures for automated reporting
- Set up scheduled exports for stakeholder reports

### Data Refresh Strategy
```
Recommended Schedule:
├─ Daily: Refresh fact_bookings (new transactions)
├─ Weekly: Update aggregated metrics
└─ Monthly: Full data refresh & archive historical data
```

## 📋 Data Dictionary

| Column | Table | Description |
|--------|-------|-------------|
| booking_id | fact_bookings | Unique booking identifier |
| property_id | fact_bookings, dim_hotels | Hotel/property reference |
| customer_id | fact_bookings | Guest identifier |
| check_in_date | fact_bookings | Guest arrival date |
| checkout_date | fact_bookings | Guest departure date |
| revenue_realized | fact_bookings | Actual revenue received |
| booking_status | fact_bookings | Checked Out / Cancelled / No Show |
| ratings_given | fact_bookings | Guest satisfaction (1-5 scale) |
| capacity | fact_aggregated_bookings | Room availability |
| occupancy_percentage | fact_aggregated_bookings | Utilization rate (%) |

## 🔒 Best Practices

✅ **Do:**
- Run backups before modifying the database
- Version control your SQL and Tableau files
- Document any custom queries or calculations
- Regularly refresh data for accuracy
- Create read-only user accounts for stakeholder access

❌ **Don't:**
- Modify fact tables directly (append-only model)
- Delete historical data without archiving
- Share database credentials in plain text
- Skip data validation before loading
- Ignore data quality checks

## 📞 Support & Maintenance

- **Data Issues**: Check data source and refresh schedules
- **Tableau Connection**: Verify MySQL connection settings
- **Performance**: Optimize queries for large datasets
- **Updates**: Maintain version control of files

## 📁 File Structure

```
Project Directory/
├── README.md (this file)
├── Hospitality Analytics - SQL .sql
├── Hospitality Analysis - Tableau.twbx
├── images/
│   ├── banner.png
│   ├── revenue-dashboard.png
│   ├── booking-metrics.png
│   ├── guest-satisfaction.png
│   ├── property-performance.png
│   ├── system-architecture.png
│   ├── tableau-revenue-dashboard.png
│   ├── tableau-occupancy-dashboard.png
│   ├── tableau-guest-dashboard.png
│   └── tableau-property-dashboard.png
└── data/
    └── (raw data files if applicable)
```

---

## 👥 Project Team
**** | P1194 Hospitality Analytics Project

### Team Members:
- Data Analysis & SQL Development
- Tableau Dashboard Design
- Project Documentation

---

## 📅 Version History

| Version | Date | Updates |
|---------|------|---------|
| 1.0 | 2026-04-13 | Initial database schema and SQL queries |
| 1.1 | 2026-04-13 | Enhanced README with visualizations |
| TBD | TBD | Additional dashboards and metrics |

---

## 📝 Notes & Future Enhancements

- [ ] Real-time data integration
- [ ] Advanced predictive analytics
- [ ] Mobile-friendly dashboard views
- [ ] Automated alerting system
- [ ] Customer segmentation analysis
- [ ] Revenue forecasting models
- [ ] Competitive benchmarking

---

## 📄 License & Usage

This project is intended for **internal use only** within the hospitality organization. Unauthorized distribution is prohibited.

---

**Last Updated**: April 13, 2026  
**Status**: 🟢 Active & Maintained

*For questions or improvements, please contact the Project Team.*
