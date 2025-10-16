/* 
=====================================================
The King’s Pantry SQL Workbook — Mercury Musings Edition
Author: Ardonna Cardines (Mercury Musings)
Dataset: the_kings_pantry (ANSI SQL)
=====================================================
Prologue — The Royal Ledger Awakens
In the storerooms beneath the castle, a ledger waits.
Today we learn to read it — and to ask better questions.
===================================================== 
*/

-- ===== Chapter I — Apprentices of the Realm =====
-- Focus: SELECT, WHERE, ORDER BY, DISTINCT, LIMIT/FETCH

/* =====================================================
   Exercise 1 — Vendors of The North
   -----------------------------------------------------
   Objective:
     Filter rows with WHERE
   Prompt:
     Retrieve all vendors located in **The North**. Show `vendor_name` and `region`.
===================================================== */
SELECT vendor_name, region
FROM vendor
WHERE region = 'The North';


/* =====================================================
   Exercise 2 — Private Label Brands (first five)
   -----------------------------------------------------
   Objective:
     Limit results and select specific columns
   Prompt:
     List the first five private label brands with `brand_name` and `private_label_tier`.
===================================================== */
SELECT brand_name, private_label_tier
FROM brand
WHERE brand_type = 'Private Label'
ORDER BY brand_name
FETCH FIRST 5 ROWS ONLY;


/* =====================================================
   Exercise 3 — Pantry Essentials Catalog
   -----------------------------------------------------
   Objective:
     Filter by category
   Prompt:
     Show `product_name`, `item_taxonomy_1`, `item_taxonomy_2`, `base_price` for products in **Pantry Essentials**.
===================================================== */
SELECT product_name, item_taxonomy_1, item_taxonomy_2, base_price
FROM product
WHERE item_taxonomy_1 = 'Pantry Essentials'
ORDER BY product_name;


/* =====================================================
   Exercise 4 — Highest Margin SKUs
   -----------------------------------------------------
   Objective:
     Sort descending by a numeric column
   Prompt:
     Return top 10 products by `margin_percentage`.
===================================================== */
SELECT product_id, product_name, margin_percentage
FROM product
ORDER BY margin_percentage DESC
FETCH FIRST 10 ROWS ONLY;


/* =====================================================
   Exercise 5 — Discontinued Products
   -----------------------------------------------------
   Objective:
     Boolean flag filters
   Prompt:
     List `product_id`, `product_name` where `is_discontinued_flag = 1`.
===================================================== */
SELECT product_id, product_name
FROM product
WHERE is_discontinued_flag = 1
ORDER BY product_id;


/* =====================================================
   Exercise 6 — Active Vendor Count
   -----------------------------------------------------
   Objective:
     Aggregate count with simple filter
   Prompt:
     Count how many vendors are currently active (`is_active_flag = 1`).
===================================================== */
SELECT COUNT(*) AS active_vendor_count
FROM vendor
WHERE is_active_flag = 1;


/* =====================================================
   Exercise 7 — Distinct Departments
   -----------------------------------------------------
   Objective:
     SELECT DISTINCT for categorical exploration
   Prompt:
     Show distinct values of `item_taxonomy_1` from `product`.
===================================================== */
SELECT DISTINCT item_taxonomy_1
FROM product
ORDER BY item_taxonomy_1;


/* =====================================================
   Exercise 8 — Customers in Dorne
   -----------------------------------------------------
   Objective:
     Basic filtering by realm
   Prompt:
     Return `first_name`, `last_name`, `realm` for customers in **Dorne**.
===================================================== */
SELECT first_name, last_name, realm
FROM customer
WHERE realm = 'Dorne'
ORDER BY last_name, first_name;


/* =====================================================
   Exercise 9 — Price vs Cost
   -----------------------------------------------------
   Objective:
     Derived columns with arithmetic
   Prompt:
     For each product, show `product_name`, `base_price`, `landed_cost`, and a column `price_minus_cost`.
===================================================== */
SELECT product_name, base_price, landed_cost,
       (base_price - landed_cost) AS price_minus_cost
FROM product
ORDER BY price_minus_cost DESC;


/* =====================================================
   Exercise 10 — Filter by Unit Size
   -----------------------------------------------------
   Objective:
     Text equality
   Prompt:
     List all products sold in `16 oz` packaging.
===================================================== */
SELECT product_id, product_name, unit_size
FROM product
WHERE unit_size = '16 oz'
ORDER BY product_id;



-- ===== Chapter II — Knights of the Query =====
-- Focus: GROUP BY, JOINs, CASE, HAVING, Subqueries

/* =====================================================
   Exercise 11 — Vendors by Region
   -----------------------------------------------------
   Objective:
     GROUP BY counts
   Prompt:
     Count vendors by `region`.
===================================================== */
SELECT region, COUNT(*) AS vendor_count
FROM vendor
GROUP BY region
ORDER BY vendor_count DESC;


/* =====================================================
   Exercise 12 — Average Margin by Brand
   -----------------------------------------------------
   Objective:
     GROUP BY averages
   Prompt:
     Show average `margin_percentage` per `brand_name` for active products.
===================================================== */
SELECT brand_name, AVG(margin_percentage) AS avg_margin_pct
FROM product
WHERE is_active_flag = 1
GROUP BY brand_name
ORDER BY avg_margin_pct DESC;


/* =====================================================
   Exercise 13 — Products with Vendor Names
   -----------------------------------------------------
   Objective:
     JOIN product to vendor
   Prompt:
     List `product_name` with its `vendor_name` (only vendor-sourced SKUs).
===================================================== */
SELECT p.product_name, v.vendor_name
FROM product p
JOIN vendor v
  ON p.vendor_id = v.vendor_id
ORDER BY v.vendor_name, p.product_name;


/* =====================================================
   Exercise 14 — Most Expensive SKU per Brand
   -----------------------------------------------------
   Objective:
     MAX per group
   Prompt:
     Show `brand_name` and its maximum `base_price`.
===================================================== */
SELECT brand_name, MAX(base_price) AS max_base_price
FROM product
GROUP BY brand_name
ORDER BY max_base_price DESC;


/* =====================================================
   Exercise 15 — Private Label vs Vendor SKUs
   -----------------------------------------------------
   Objective:
     Boolean aggregation
   Prompt:
     Count SKUs grouped by `is_private_label`.
===================================================== */
SELECT is_private_label, COUNT(*) AS sku_count
FROM product
GROUP BY is_private_label
ORDER BY is_private_label DESC;


/* =====================================================
   Exercise 16 — Top Brands by Average Margin
   -----------------------------------------------------
   Objective:
     Aggregate + order + limit
   Prompt:
     Return the top 5 brands by average margin percentage.
===================================================== */
SELECT brand_name, AVG(margin_percentage) AS avg_margin_pct
FROM product
GROUP BY brand_name
ORDER BY avg_margin_pct DESC
FETCH FIRST 5 ROWS ONLY;


/* =====================================================
   Exercise 17 — Cheapest Product per Category (Subquery)
   -----------------------------------------------------
   Objective:
     Correlated subquery
   Prompt:
     For each `item_taxonomy_1`, return the product with the minimum `base_price`.
===================================================== */
SELECT p1.item_taxonomy_1, p1.product_id, p1.product_name, p1.base_price
FROM product p1
WHERE p1.base_price = (
  SELECT MIN(p2.base_price)
  FROM product p2
  WHERE p2.item_taxonomy_1 = p1.item_taxonomy_1
)
ORDER BY p1.item_taxonomy_1, p1.base_price;


/* =====================================================
   Exercise 18 — Landed vs Purchase Cost by Vendor
   -----------------------------------------------------
   Objective:
     JOIN + math + GROUP BY
   Prompt:
     For vendor-sourced SKUs, compute average `landed_cost - purchase_cost` per vendor.
===================================================== */
SELECT v.vendor_name,
       AVG(p.landed_cost - p.purchase_cost) AS avg_landed_minus_purchase
FROM product p
JOIN vendor v
  ON p.vendor_id = v.vendor_id
GROUP BY v.vendor_name
ORDER BY avg_landed_minus_purchase DESC;


/* =====================================================
   Exercise 19 — Active vs Inactive Customers by Realm
   -----------------------------------------------------
   Objective:
     Conditional aggregation with CASE
   Prompt:
     For each realm, count active vs inactive customers using `is_active_flag`.
===================================================== */
SELECT realm,
       SUM(CASE WHEN is_active_flag = 1 THEN 1 ELSE 0 END) AS active_customers,
       SUM(CASE WHEN is_active_flag <> 1 THEN 1 ELSE 0 END) AS inactive_customers
FROM customer
GROUP BY realm
ORDER BY active_customers DESC;


/* =====================================================
   Exercise 20 — Duplicate Product Names
   -----------------------------------------------------
   Objective:
     HAVING with counts
   Prompt:
     Find any product names that appear more than once.
===================================================== */
SELECT product_name, COUNT(*) AS name_count
FROM product
GROUP BY product_name
HAVING COUNT(*) > 1
ORDER BY name_count DESC, product_name;



-- ===== Chapter III — Archmaesters of Data =====
-- Focus: CTEs, Windows, Self-Joins, Ranking, Analytical Views

/* =====================================================
   Exercise 21 — Parent and Child Customers
   -----------------------------------------------------
   Objective:
     Self-join on parent_customer_id
   Prompt:
     Show each customer and their parent customer (if any).
===================================================== */
SELECT c.customer_id,
       c.first_name || ' ' || c.last_name AS customer_name,
       p.customer_id AS parent_id,
       p.first_name || ' ' || p.last_name AS parent_name
FROM customer c
LEFT JOIN customer p
  ON c.parent_customer_id = p.customer_id
ORDER BY parent_id NULLS FIRST, customer_name;


/* =====================================================
   Exercise 22 — Running Total Sales by Order Date
   -----------------------------------------------------
   Objective:
     Analytical running sum (ANSI standard window)
   Prompt:
     Compute running total of `order_total` by `order_date`.
===================================================== */
SELECT order_date,
       SUM(order_total) OVER (ORDER BY order_date
                              ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_order_total
FROM sales_order
WHERE order_total IS NOT NULL
ORDER BY order_date;


/* =====================================================
   Exercise 23 — Rank Brands by Total Net Sales
   -----------------------------------------------------
   Objective:
     Join fact + dim and rank using window
   Prompt:
     Calculate total `net_sales` per brand (via product) and rank descending.
===================================================== */
WITH brand_sales AS (
  SELECT p.brand_name,
         SUM(sod.net_sales) AS total_net_sales
  FROM sales_order_details sod
  JOIN product p
    ON sod.product_id = p.product_id
  GROUP BY p.brand_name
)
SELECT brand_name,
       total_net_sales,
       RANK() OVER (ORDER BY total_net_sales DESC) AS sales_rank
FROM brand_sales
ORDER BY sales_rank;


/* =====================================================
   Exercise 24 — Revenue by Brand Type
   -----------------------------------------------------
   Objective:
     Join through brand to group by brand_type
   Prompt:
     Compute net revenue grouped by `brand_type` (Private Label vs Vendor).
===================================================== */
SELECT b.brand_type,
       SUM(sod.net_sales) AS total_revenue
FROM sales_order_details sod
JOIN product p
  ON sod.product_id = p.product_id
JOIN brand b
  ON p.brand_id = b.brand_id
GROUP BY b.brand_type
ORDER BY total_revenue DESC;


/* =====================================================
   Exercise 25 — Monthly Margin Totals
   -----------------------------------------------------
   Objective:
     Date grouping
   Prompt:
     Aggregate total `margin` by calendar month from `sales_order_details` joined to `sales_order`.
===================================================== */
SELECT EXTRACT(YEAR FROM so.order_date) AS yr,
       EXTRACT(MONTH FROM so.order_date) AS mo,
       SUM(sod.margin) AS total_margin
FROM sales_order_details sod
JOIN sales_order so
  ON sod.sales_order_id = so.sales_order_id
GROUP BY EXTRACT(YEAR FROM so.order_date), EXTRACT(MONTH FROM so.order_date)
ORDER BY yr, mo;


/* =====================================================
   Exercise 26 — Top 3 Vendors by Net Sales
   -----------------------------------------------------
   Objective:
     Windowed row_number for top-N per entire set
   Prompt:
     Return the top 3 vendors by total net sales.
===================================================== */
WITH vendor_sales AS (
  SELECT v.vendor_name, SUM(sod.net_sales) AS total_sales
  FROM sales_order_details sod
  JOIN product p
    ON sod.product_id = p.product_id
  JOIN vendor v
    ON p.vendor_id = v.vendor_id
  GROUP BY v.vendor_name
)
SELECT vendor_name, total_sales
FROM (
  SELECT vendor_name, total_sales,
         ROW_NUMBER() OVER (ORDER BY total_sales DESC) AS rn
  FROM vendor_sales
) t
WHERE rn <= 3
ORDER BY total_sales DESC;


/* =====================================================
   Exercise 27 — High-Margin SKUs (CTE)
   -----------------------------------------------------
   Objective:
     CTE + filter then select
   Prompt:
     Create a CTE of SKUs with `margin_percentage > 50` and list vendor + product.
===================================================== */
WITH high_margin AS (
  SELECT product_id, product_name, brand_name, margin_percentage, vendor_id
  FROM product
  WHERE margin_percentage > 50
)
SELECT h.product_id, h.product_name, v.vendor_name, h.margin_percentage
FROM high_margin h
LEFT JOIN vendor v
  ON h.vendor_id = v.vendor_id
ORDER BY h.margin_percentage DESC;


/* =====================================================
   Exercise 28 — Private Label Share by Category
   -----------------------------------------------------
   Objective:
     Within-category share calculation
   Prompt:
     For each `item_taxonomy_1`, compute private label share of total net sales.
===================================================== */
WITH cat_sales AS (
  SELECT p.item_taxonomy_1 AS category,
         SUM(sod.net_sales) AS total_sales,
         SUM(CASE WHEN p.is_private_label = 1 THEN sod.net_sales ELSE 0 END) AS pl_sales
  FROM sales_order_details sod
  JOIN product p
    ON sod.product_id = p.product_id
  GROUP BY p.item_taxonomy_1
)
SELECT category,
       pl_sales,
       total_sales,
       CASE WHEN total_sales > 0 THEN (pl_sales * 1.0) / total_sales ELSE 0 END AS private_label_share
FROM cat_sales
ORDER BY private_label_share DESC;


/* =====================================================
   Exercise 29 — Multi-Category Customers
   -----------------------------------------------------
   Objective:
     Customer breadth using count distinct
   Prompt:
     Find customers who bought from more than one top-level category.
===================================================== */
SELECT so.customer_id,
       COUNT(DISTINCT p.item_taxonomy_1) AS distinct_categories
FROM sales_order_details sod
JOIN product p
  ON sod.product_id = p.product_id
JOIN sales_order so
  ON sod.sales_order_id = so.sales_order_id
GROUP BY so.customer_id
HAVING COUNT(DISTINCT p.item_taxonomy_1) > 1
ORDER BY distinct_categories DESC, so.customer_id;


/* =====================================================
   Exercise 30 — Build FactSales View
   -----------------------------------------------------
   Objective:
     Star-join the core sales entities
   Prompt:
     Create a view that joins order headers, order lines, products, brands, vendors, and customers.
===================================================== */
-- Depending on your permissions, you may need to DROP VIEW first.
-- This statement is ANSI-friendly; if your dialect differs, adjust CREATE OR REPLACE accordingly.
CREATE VIEW fact_sales AS
SELECT
  sod.sales_order_detail_id,
  sod.sales_order_id,
  so.order_date,
  so.customer_id,
  c.first_name AS customer_first_name,
  c.last_name  AS customer_last_name,
  c.realm,
  p.product_id,
  p.product_name,
  p.item_taxonomy_1 AS category,
  p.item_taxonomy_2 AS subcategory,
  p.brand_id,
  b.brand_name,
  b.brand_type,
  p.vendor_id,
  v.vendor_name,
  sod.quantity_ordered,
  sod.unit_price,
  sod.discount_pct,
  sod.discount_per_unit,
  sod.line_subtotal,
  sod.line_tax,
  sod.net_sales,
  sod.margin
FROM sales_order_details sod
LEFT JOIN sales_order so
  ON sod.sales_order_id = so.sales_order_id
LEFT JOIN customer c
  ON so.customer_id = c.customer_id
LEFT JOIN product p
  ON sod.product_id = p.product_id
LEFT JOIN brand b
  ON p.brand_id = b.brand_id
LEFT JOIN vendor v
  ON p.vendor_id = v.vendor_id;


/* 
=====================================================
Epilogue
You’ve walked the length of the ledger and back again.
Carry these queries into any realm that needs clarity.
=====================================================
The Mercury Brand System | mercurymusings.com
=====================================================
*/