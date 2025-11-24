UPDATE superstore
SET 
	Discount = Discount * 100;

ALTER TABLE superstore
ADD COLUMN "Profit Margin" DOUBLE;

ALTER TABLE superstore
ADD	COLUMN "Item Cost" DOUBLE;

ALTER TABLE superstore
ADD COLUMN "Month" VARCHAR;

UPDATE superstore
SET
	"Profit Margin" = ROUND(Profit/Sales, 2) * 100,
	"Item Cost" = ROUND(Sales/Quantity, 2);
	
UPDATE superstore
SET
	"Month" = STRFTIME('%Y-%m',DATE_TRUNC('month', CAST("Order Date" AS DATE)));

