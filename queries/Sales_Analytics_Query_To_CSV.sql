COPY (
  SELECT 
  	Category, 
	ROUND(SUM(Sales), 2) AS sales, 
	ROUND(SUM(Profit), 2) AS profit
  FROM superstore
  GROUP BY Category
) TO 'category_sales_profit.csv' (HEADER);

COPY (
  SELECT 
  	"Customer ID", 
	"Customer Name", 
	ROUND(SUM(Sales), 2) AS total_sales
  FROM superstore
  GROUP BY "Customer ID", "Customer Name"
  ORDER BY total_sales DESC
  LIMIT 20
) TO 'top_customers.csv' (HEADER);

COPY(
	WITH monthly AS (
		SELECT
			DATE_TRUNC('month', CAST("Order Date" AS DATE)) AS month_start,
			STRFTIME('%Y-%m',DATE_TRUNC('month', CAST("Order Date" AS DATE))) AS month,
			ROUND(SUM(Sales), 2) AS Sales
		FROM superstore
		GROUP BY month_start
	)
	SELECT
		month,
		sales,
		ROUND(
			SUM(sales) OVER(
				ORDER BY month_start
				RANGE BETWEEN INTERVAL 2 MONTH PRECEDING AND CURRENT ROW
			), 2
		) AS rolling_3_month_sales
	FROM monthly
	ORDER BY month_start
) TO 'rolling_sales.csv' (HEADER);

COPY(
	SELECT
		ROUND(Discount * 100, 0) AS discount_pct,
		ROUND(AVG((Profit / Sales) * 100), 2) AS avg_profit_margin
	FROM superstore
	GROUP BY discount_pct
	ORDER BY discount_pct
) TO 'discount_margin.csv' (HEADER);

COPY(
	SELECT
		"Sub-Category",
		ROUND(Discount, 0) AS discount_pct,
		ROUND(AVG((Profit / Sales) * 100), 0) AS avg_profit_margin
	FROM superstore
	GROUP BY discount_pct, "Sub-Category"
	ORDER BY discount_pct, "Sub-Category"
) TO 'discount_identifiers.csv' (HEADER);

COPY(
	SELECT * FROM superstore
) TO 'superstore.csv' (HEADER);