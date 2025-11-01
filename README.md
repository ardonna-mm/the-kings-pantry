# 🪄 The King’s Pantry — SQL Courses (Mercury Musings Edition)


![Made with Colab](https://img.shields.io/badge/Made%20with-Colab-orange?logo=googlecolab)
![SQL](https://img.shields.io/badge/Language-SQL-blue)
![License: MIT](https://img.shields.io/badge/License-MIT-green)
![Status: Active](https://img.shields.io/badge/Status-Active-success) 


A story-driven SQL learning experience set in a fantasy world built on real business logic. You’ll query trade routes, manage royal ledgers, and uncover the economics of the realm — one `JOIN` at a time.

---

## 🌿 About the Project

Welcome to **The King’s Pantry** — where data meets world-building. If *AdventureWorks* and *Game of Thrones* had a data baby, this would be it.

You’ll learn SQL through story by querying trade routes, managing royal ledgers, and uncovering the economics of the realm.

Every table represents a piece of a royal supply chain, from noble vendors and private-label brands to orders fulfilled across the Seven Realms. Behind the narrative lies a fully modeled **ERP-style dataset**, reflecting real-world business logic: brands, vendors, customers, sales orders, and detailed margins.

This project blends **fantasy storytelling with technical mastery**, showing that analytics can be equal parts creative and rigorous. It’s not just about learning SQL — it’s about learning to *think* like a data analyst in a living world.

---

## ⚡ Quick Start: Choose Your Path  

In the storerooms beneath the castle, three paths await you: each designed for a different kind of analyst. No setup required. Simply open, run, and explore the realm.  

| 🧭 Learning Path | 🏁 Start Here | ⚙️ Best For |
|:-----------------|:-------------|:------------|
| **🪶 Colab Notebook I — The Squire’s Path** | [Open in Colab](https://colab.research.google.com/drive/1QWaWm2D9YivdN6B55hbG9_ZzzTFBiApV#scrollTo=9c3e6206&uniqifier=2) | **Beginners** who want a fully guided, story-driven journey through SQL basics. |
| **📜 Colab Notebook II — Lord Comnmander of the Kingsguard** *(coming soon)* | — | **Intermediate learners** who want to dive deeper with additional commentary, reflections, and business parallels. |
| **⚔️ SQL Workbook (.sql) — Hand of the King ** |--| **Advanced analysts** who prefer working directly in MySQL or SQL Server. Includes full query list with schema notes. |
| **🏰 Kaggle Dataset — Archmaester of Data** | [View Dataset](https://www.kaggle.com/datasets/...) | **Analysts & creators** who want to use *The King’s Pantry* data for Power BI, Python, or storytelling projects. |

---

 ## 🧩 Behind the Lore and Logic

This project was inspired by ERP systems I’ve worked with in the real world as a data analyst.  
When I say this is rooted in business logic, I mean it literally. These tables and queries mirror the data models and analyses I’ve built for **distribution companies and retailers**.

From ad-hoc reporting to deep-dive sales analysis, I drew inspiration from what I know best — and then wrapped it in a fantasy world to make learning fun.

While most SQL tutorials keep a corporate tone, *The King’s Pantry* takes a different approach: on the surface it’s whimsical, but underneath it’s structured like a **real ERP system**.

I didn’t just generate random sales totals, product names, or customer IDs. Every decision in this dataset — from incorporating **freight into landed cost**, to defining **item_taxonomy_1** and **item_taxonomy_2**, to formatting sales orders like `SO-1001` — was deliberate.  

Most practice datasets simplify realism away.  
Here, even the smallest details (like how an ID number looks) are built to reflect real-world systems.  

Fantasy might sound playful, until you explore the dataset yourself and see the depth in everything.

It’s designed to work seamlessly across **SQL, Python, and Power BI**, making it practical for both technical and creative learners alike.

---

📂 **Reference Files: Behind the Business Logic**

If you’d like to peek under the hood, these files show how the dataset’s business rules were designed and tested:

| File | Description |
|------|--------------|
| [`docs_category_weighting.csv`](./references/docs_category_weighting.csv) | Defines category share by product type and applied multipliers for sales distribution. |
| [`docs_customer_mix.csv`](./references/docs_customer_mix.csv) | Models retail vs. wholesale ratio, average spend, and region weight. |
| [`docs_discount_logic.csv`](./references/docs_discount_logic.csv) | SQL snippets used to simulate realistic promotions and tax applications. |
| [`docs_tax_logic.csv`](./references/docs_tax_logic.csv) | SQL snippets used to simulate realistic promotions and tax applications. |
| [`sales_channel_lookup.csv`](./references/sales_channel_lookup.csv) | Lookup table mapping sales channels (RP, MS, GS, CC) to business rules. |

Each logic file contributes to making *The King’s Pantry* more than just a dataset —  
it’s a **living ecosystem of analytics**, built to teach you how data behaves in the real world.

> *Because even data deserves a little magic.*

---


## 🪶 Author

 *Created with quills, queries, and curiosity.*  
[mercurymusings.blog](https://mercurymusings.blog) | [Kaggle](https://www.kaggle.com/ardonnalcardines) | [LinkedIn](https://www.linkedin.com/in/ardonnacardines/)

---

## 🪪 License

This project is licensed under the **MIT License**, allowing others to learn, adapt, and share with attribution.  
See the [LICENSE](LICENSE) file for details.
