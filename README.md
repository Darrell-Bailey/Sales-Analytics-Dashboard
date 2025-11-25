# Sales-Analytics-Dashboard

## Problem Statement
The business is looking to determine how discount pct. affects total profit/profit margin and develop
a general sales analytics dashboard based off of the limited data set.

## Objectives
- Ingest data into duckdb from csv file
- Determine any necessary cleaning steps
- Generate new columns based on existing data (Profit Margin, Month, Item Cost)
- Extract csv files from queries and the entire database table as well
- Upload csv files to google sheets for reporting
- Build out tables, reports and pivot tables

## SQL Queries
- [CSV Outputs](reports/Sales_Analytics_Query_To_CSV.sql)
- [Table Updates/Alterations](queries/Table_Alterations.sql)

## Sales Analytics Dashboard
Here are some screenshots of a general sales analytics dashboard. There are some additional reports that could be generated
such as sales/profit by various other dimensions then those shown. 

Dashboard:
[Sales Dashboard](reports/dashboard.png)

## Findings
Based off of the following report it maybe necessary for the business to evaluate whether or not it should continue offering 
products from the following sub-categories:
- Fasteners
- Supplies
- Bookcases
- Tables

[Profit/Loss by Sub-Category](reports/profit_loss_by_subc.png)

Additionally the data suggest that an effort could be made to evaluate the reasons behind why high discount pct. (determined
by business) are being offered for certain categories or during specific periods of the year. This can be seen in the following:

[Losses Summed by Month (Not Month and Year)](reports/losses_same_mont_across_years.png)

[Profit/Loss by Discount Pct. and Sub-Category](reports/profit_loss_dis_pct_sub_c.png)

## Additional/Future Thinking
For further in-depth findings it would be necessary to have data that is not offered in this dataset, such as item price, sales tax,
promotional offers, inventory clean-out. With additional data points it could be perused as to why high discount pct. are being offered for
specific products, during certain periods of the year, cities/states/regions in the United States or to specific customers/clients. This could
lead to building a strategy for potential phasing out certain product categories or evaluating whether or not there would be a drop in sales if
there was a lower discount pct. offered.
