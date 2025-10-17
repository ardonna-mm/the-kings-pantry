**The King’s Pantry – Dataset Design Breakdown**
Overview

The King’s Pantry was designed as a story-driven dataset grounded in real-world business logic.
Although framed within a fantasy narrative, its underlying structure mirrors that of ERP and retail analytics systems — with vendor, customer, product, and sales order tables designed to replicate real distribution workflows.

This document outlines the logic behind each table, how the data was modeled, and how the system aligns with real-world business analysis.
It also includes the reference frameworks used for category weighting, discount rules, tax logic, and customer segmentation.

**Table 1: Brand**

The brand table represents product ownership and private label hierarchy within a multi-tier structure.

Columns and Purpose:

brand_id: Unique identifier for each brand.

brand_name: The commercial name of the brand.

brand_type: Defines ownership level (e.g., Royal Reserve = premium private label, Guild Goods = mid-tier, Commonfare = budget tier).

vendor_id: Foreign key linking to the vendor who supplies or manages the brand.

Business Parallel:
In ERP systems, this models the relationship between private-label programs and suppliers. It allows analysts to evaluate margin by brand type, supplier concentration, and brand portfolio performance.

**Table 2: Vendor**

The vendor table stores supplier data — the external partners that provide goods for sale.

Columns and Purpose:

vendor_id: Unique vendor identifier.

vendor_name: Supplier or guild name.

region: Geographic segment (e.g., The North, The Reach, The Vale).

contact_name and contact_email: Used to simulate a real B2B relationship.

Business Parallel:
In distribution analytics, vendor data is essential for supply chain performance, regional sourcing mix, and cost-to-supply analyses.
Filtering by region or vendor type parallels everyday procurement and logistics reporting.

**Table 3: Product**

The product table is the core of the item master — defining every SKU available for sale.

Columns and Purpose:

product_id: Unique SKU identifier.

product_name: Item description.

brand_id: Links each product to a brand.

item_taxonomy_1: Category (e.g., Beverages, Bakery & Sweets, Produce).

item_taxonomy_2: Subcategory (e.g., Mead, Bread, Fresh Fruit).

unit_cost: Landed cost after freight and vendor discounts.

unit_price: Selling price before discounts.

margin_pct: Derived margin percentage, computed from cost and price.

is_private_label: Boolean flag for private-label products.

Business Parallel:
This mirrors a real ERP item master used by distributors and retailers. It enables category performance, margin optimization, and mix analysis at SKU or brand level.

**Table 4: Customer**

The customer table captures both B2B and B2C profiles within the same dataset.

Columns and Purpose:

customer_id: Unique identifier for each customer.

customer_name: Name or account label (individual or company).

customer_type: “Retail” or “Wholesale”.

region: The realm or territory of the customer.

loyalty_tier: Derived from total order value over time.

Business Parallel:
Combining consumer and trade customers allows for analysis of customer mix, regional sales behavior, and loyalty segmentation.
This structure mimics real CRM integrations where both end consumers and trade buyers are tracked together.

**Table 5: Sales Order**

The sales_order table serves as the transaction header — capturing order-level information.

Columns and Purpose:

sales_order_id: Unique order reference (e.g., SO-1001).

order_date: Transaction date.

customer_id: Buyer reference.

sales_channel: Channel through which the order was placed (e.g., RP, MS, GS, CC).

discount_amount: Total discount at order level.

tax_amount: Total tax applied at order level.

freight_cost: Freight or delivery cost.

order_status: Status (e.g., Completed, Pending, Canceled).

Business Parallel:
This table reflects a standard ERP sales header structure. It supports performance analysis across time, channels, and customer types — a foundation for revenue, discount, and delivery cost analytics.

**Table 6: Sales Order Details**

The sales_order_details table represents the line-level transactions under each sales order.

Columns and Purpose:

sales_order_detail_id: Unique line reference.

sales_order_id: Parent order key.

product_id: Item sold.

quantity: Units purchased.

unit_price: Selling price per unit.

extended_price: Total line revenue before discount or tax.

discount_amount: Discount applied to this line.

tax_amount: Calculated tax for this line.

Business Parallel:
This structure enables gross-to-net analysis, item-level profitability, and sales mix calculations.
It is modeled on ERP line-item logic, commonly found in Oracle, SAP, and Dynamics systems.

**Table 7: Sales Channel Lookup**

The sales_channel_lookup table provides channel metadata for mapping codes to business descriptions.

Columns and Purpose:

channel_code: Abbreviated code (e.g., RP = Raven Prime).

channel_name: Full name of the channel.

channel_type: Segment classification (e.g., B2C, B2B).

Business Parallel:
Acts as a standard lookup dimension to improve reporting consistency. Enables channel-level performance dashboards and cross-platform reporting.

**Reference Logic Frameworks**
Category Weighting

Weights are applied to product categories to control proportional contribution across item_taxonomy_1 and item_taxonomy_2.
This ensures category balance and realistic revenue distribution, similar to retail assortment weighting in demand planning.

Customer Mix

Customer distributions are defined across Retail vs. Wholesale segments, simulating diverse buyer types and ensuring variability in average order values.

Discount Logic

Discount tiers follow business logic — higher discounts for bulk or wholesale orders, lower for retail.
This reflects standard B2B pricing structures seen in real distribution models.

Tax Logic

Tax rates are applied by region, ensuring analytical accuracy when calculating net sales and margin by territory.
The system mimics region-based tax application common in ERP finance modules.

**Analytical Design Philosophy**

The King’s Pantry was built to be platform-agnostic — usable in SQL, Python, and Power BI.
The dataset’s schema was normalized for relational integrity while remaining easy to adapt for star and snowflake models.

This ensures:

Accurate aggregations in BI tools.

Flexibility for SQL practice.

Compatibility with Python pandas workflows.

Each exercise and metric traces back to real-world business processes, making this dataset not only a learning tool but also a miniature ERP simulation.
