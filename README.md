# Advanced SQL Architecture & Transaction Management

## 📌 Overview
This repository showcases the implementation of complex business logic directly at the database level using MySQL/MariaDB. It moves beyond simple CRUD operations to demonstrate a robust architecture designed for data integrity, concurrency, and automated auditing.

## ⚙️ Core Implementations
* **Stored Procedures & Error Handling:** Use of `DECLARE EXIT HANDLER` for precise exception management (e.g., catching duplicate entries, foreign key violations, or missing data) coupled with `ROLLBACK` mechanisms to ensure ACID compliance.
* **Complex Triggers:** 
  * Automated logging and auditing of events (e.g., tracking missing customer addresses).
  * Real-time calculation of dynamic fields (e.g., calculating fuel costs based on distance and vehicle consumption models before inserting a trip record).
  * Stock minimum alerts and daily incident limit enforcement.
* **Views:** Creation of detailed views for analytical queries and reporting without exposing raw table structures.

## 🚀 Relevance
For Site Reliability and Backend Engineering, understanding how databases lock, rollback, and handle exceptions internally is critical for diagnosing slow queries or application bottlenecks in production environments.

*Tech Stack: MariaDB, MySQL, Relational Database Design, SQL Triggers, Stored Procedures.*
