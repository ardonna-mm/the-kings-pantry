# 🪄 The King’s Pantry — SQL Workbook (Mercury Musings Edition)


![Made with Colab](https://img.shields.io/badge/Made%20with-Colab-orange?logo=googlecolab)
![SQL](https://img.shields.io/badge/Language-SQL-blue)
![License: MIT](https://img.shields.io/badge/License-MIT-green)
![Status: Active](https://img.shields.io/badge/Status-Active-success)


A story-driven SQL learning experience set in a fantasy world built on real business logic.  
You’ll query trade routes, manage royal ledgers, and uncover the economics of the realm — one `JOIN` at a time.

---

## 🌿 About the Project

**The King’s Pantry** began as a thought experiment:  
What if you could learn SQL not through dry tables, but through *world-building*?

Every table represents a piece of a royal supply chain — from noble vendors and private-label brands to orders fulfilled across the Seven Realms.  
Behind the narrative lies a fully modeled **ERP-style dataset** reflecting real-world business logic: brands, vendors, customers, sales orders, and detailed margins.

This project blends **fantasy storytelling with technical mastery**, showing that analytics can be equal parts creative and rigorous.  
It’s not just about learning SQL — it’s about learning to *think* like a data analyst in a living world.

---

## ⚡ Quick Start

Welcome to **The King’s Pantry** — where data meets world-building.  
If AdventureWorks and *Game of Thrones* had a data baby, this would be it.

You’ll learn SQL through story — querying trade routes, managing royal ledgers, and uncovering the economics of the realm.

**Choose your path:**

| Learning Path | Start Here | Best For |
|----------------|-------------|----------|
| 🪄 **Colab Notebook** | [Open in Colab](https://colab.research.google.com/github/aleighcar/the-kings-pantry/blob/main/Kings_Pantry_SQL_Workbook.ipynb) | Beginners who want an interactive, guided journey. |
| ⚙️ **SQL Workbook** | [Download .sql](https://github.com/aleighcar/the-kings-pantry/blob/main/Kings_Pantry_SQL_Workbook.sql) | Intermediate users who prefer working directly in MySQL or SSMS. |
| 📊 **Kaggle Dataset** | [View Dataset](https://www.kaggle.com/datasets/ardonnalcardines/the-kings-pantry-launch-1) | Analysts who want to use the same data for Power BI or Python analysis. |

**No complex setup required.**  
Open the Colab, load the data, and start your first query — *“Apprentice of the Realm.”*

---

> “In the storerooms beneath the castle, data waits to be understood.”  
> — *The Royal Ledger, Mercury Musings Edition*

---

## 🪄 Workbook Files

Choose your adventure based on how you like to learn.  

| File | Description |
|------|-------------|
| [`Kings_Pantry_SQL_Workbook.ipynb`](https://colab.research.google.com/github/aleighcar/the-kings-pantry/blob/main/Kings_Pantry_SQL_Workbook.ipynb) | **Start here if you’re new to SQL or prefer a guided, story-driven experience.** Open this in Google Colab to follow along with narrative prompts, run queries, and learn interactively — no setup needed. |
| [`Kings_Pantry_SQL_Workbook.sql`](Kings_Pantry_SQL_Workbook.sql) | **For intermediate learners or SSMS/MySQL users.** A clean, fully commented `.sql` file with all 30 exercises — ready to run in your local SQL environment. |
| [Dataset on Kaggle](https://www.kaggle.com/datasets/ardonnalcardines/the-kings-pantry-launch-1) | **Optional:** The same dataset in CSV format — perfect for Power BI, Tableau, or Python analysis. |

---

## ⚙️ How to Begin

1. **If you’re using Colab (recommended for beginners):**  
   - Click “Open in Colab” below or open the `.ipynb` link above.  
   - Run each cell and follow the prompts as you move from *Apprentice* to *Archmaester*.  

2. **If you’re using MySQL or SQL Server:**  
   - Download and run `the_kings_pantry.sql` once to create your database and load all tables.  
   - Then open `Kings_Pantry_SQL_Workbook.sql` in your SQL editor to follow the exercises.  

3. **Optional:** Use the Kaggle dataset if you want to explore the same data visually in Power BI or with Python.

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/aleighcar/the-kings-pantry/blob/main/Kings_Pantry_SQL_Workbook.ipynb)

## 🏗️ Dataset Setup

Before you begin your SQL journey, you’ll need **The King’s Pantry** database.  
Every table represents a piece of the royal supply chain — from noble vendors to private-label brands and loyal customers.

You can set up the data in two ways:

---

### 🪄 Option 1 — Easiest: Load from GitHub (Recommended for Colab Users)

No installation needed — the data loads straight from your GitHub repo.  
Just run this code cell in Colab (already included in the notebook):

```python
import pandas as pd

# Load tables directly from GitHub raw links
brand = pd.read_csv('https://raw.githubusercontent.com/aleighcar/the-kings-pantry/main/data/brand.csv')
vendor = pd.read_csv('https://raw.githubusercontent.com/aleighcar/the-kings-pantry/main/data/vendor.csv')
product = pd.read_csv('https://raw.githubusercontent.com/aleighcar/the-kings-pantry/main/data/product.csv')
customer = pd.read_csv('https://raw.githubusercontent.com/aleighcar/the-kings-pantry/main/data/customer.csv')
sales_order = pd.read_csv('https://raw.githubusercontent.com/aleighcar/the-kings-pantry/main/data/sales_order.csv')
sales_order_details = pd.read_csv('https://raw.githubusercontent.com/aleighcar/the-kings-pantry/main/data/sales_order_details.csv')

print("📦 Data loaded successfully!")
```

---

### ⚙️ Option 2 — Build the Database Manually (for SQL Server or MySQL)

If you’d rather explore the royal ledgers directly in your own SQL environment, follow these steps:

1. **Download and run the setup script:**  
   [the_kings_pantry.sql](the_kings_pantry.sql)  
   This script creates all six tables and loads the data automatically.  

   ```sql
   -- Creates tables for The King's Pantry dataset
   -- Tables: brand, vendor, product, customer, sales_order, sales_order_details

   SOURCE the_kings_pantry.sql;

  2. Confirm your database name:
Make sure the database was created as the_kings_pantry.

  3. Verify your tables:
Once loaded, you should see these six tables:

- brand

- vendor

- product

- customer

- sales_order

- sales_order_details

  4. You’re ready to query.
  Open your SQL editor (SSMS, MySQL Workbench, or your favorite tool), and start your journey from Apprentice to Archmaester — one query at a time.



---

## 🧱 SQL Progression Overview

| Level | Chapter | Core Concepts |
|--------|----------|----------------|
| 🧩 Beginner | *Apprentices of the Realm* | `SELECT`, `WHERE`, `ORDER BY`, simple filters |
| ⚔️ Intermediate | *Knights of the Query* | `JOIN`, `GROUP BY`, `CASE`, subqueries |
| 🔮 Advanced | *Archmaesters of Data* | `CTE`, `WINDOW FUNCTIONS`, parent-child hierarchies |

Each exercise is written in clean, ANSI-neutral SQL so you can practice in MySQL, PostgreSQL, or SQL Server.

---

## 💡 Notes

- Replace `FETCH FIRST n ROWS ONLY` → `LIMIT n` if using MySQL.
- Ideal for analysts learning to write business-focused SQL in a creative setting.
- Pairs seamlessly with the **Power BI Tutorial** available on Kaggle.

---

## 🪶 Author

 *Created with quills, queries, and curiosity.*  
Part of the **Mercury Musings Storytelling SQL Series**  
[mercurymusings.blog](https://mercurymusings.blog) | [Kaggle](https://www.kaggle.com/ardonnalcardines) | [LinkedIn](https://www.linkedin.com/in/ardonnacardines/)

---

## 🪪 License

This project is licensed under the **MIT License**, allowing others to learn, adapt, and share with attribution.  
See the [LICENSE](LICENSE) file for details.
