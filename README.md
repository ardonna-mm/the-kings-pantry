# 🪄 The King’s Pantry — SQL Workbook (Mercury Musings Edition)

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

## 📦 Dataset Setup

Before running the exercises, you’ll need the King’s Pantry database.  
Run this SQL file in MySQL or SSMS to create all tables and load the data:

[`the_kings_pantry.sql`](<ADD_LINK_HERE>)

This script builds:
- `brand`
- `vendor`
- `product`
- `customer`
- `sales_order`
- `sales_order_details`

---

## 🧾 Workbook Files

| File | Description |
|------|--------------|
| [`Kings_Pantry_SQL_Workbook.sql`](<ADD_LINK_HERE>) | Full SQL exercises (30 total) — beginner to advanced |
| [`Kings_Pantry_SQL_Workbook.ipynb`](<ADD_LINK_HERE>) | Story-driven Colab / Jupyter Notebook version |
| [Dataset on Kaggle](<ADD_KAGGLE_LINK_HERE>) | CSV version of the same data for Power BI or Python analysis |

---

## ⚙️ How to Use (Jess Ramos Style)

1. Run **`the_kings_pantry.sql`** once to build your database.
2. Open **`Kings_Pantry_SQL_Workbook.sql`** or the Colab notebook below.
3. Read the story prompts, try each query, and follow your journey from *Apprentice* to *Archmaester*.

[![Open in Colab](https://colab.research.google.com/assets/colab-badge.svg)](<YOUR_COLAB_LINK_HERE>)

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

**Ardonna Cardines**  
*The Mercury Brand System | mercurymusings.com*  
📍 *Data, dopamine, and a dash of delusion.*

---

## 🪪 License

This project is licensed under the **MIT License**, allowing others to learn, adapt, and share with attribution.  
See the [LICENSE](LICENSE) file for details.
