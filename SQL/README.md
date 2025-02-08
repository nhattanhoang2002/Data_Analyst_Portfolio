# SQL Queries for Data Analysis

Welcome to this repository, which contains several **SQL scripts** used for data analysis. Below is a list of the `.sql` files and a brief description of what each one does:

## 1. `warehouse_orders_analysis.sql`

**Purpose**:  
* Combine data from the `warehouse` and `orders` tables.  
* Calculate the number of orders per warehouse and the total orders across the entire system (via a subquery).  
* Categorize warehouses based on the percentage of total orders they fulfill.  
* Exclude warehouses with no orders (using `HAVING`).

**Usage**:  
* Copy the file contents into the BigQuery Console (or any equivalent SQL tool).  
* Adjust the project/dataset names if needed.  
* Run the query to get a result table showing each warehouse and its percentage of fulfilled orders.

## 2. `citi_bike_analysis.sql`

**Purpose**:  
* Analyze Citi Bike data (BigQuery) to calculate average bike availability by station and compare it to a global average.  
* Identify stations with the highest number of trips.  
* Compute average trip duration and show the trips that deviate the most from that average.

**Usage**:  
* Open the `.sql` file in your preferred editor.  
* Load the script into BigQuery (or wherever you have the Citi Bike dataset).  
* Adjust table/dataset names if they differ from the examples.  
* Execute each query block to view the analysis results.

## 3. `fda_food_events_analysis.sql`

**Purpose**:  
* Query the `bigquery-public-data.fda_food.food_events` table to find:  
  * The top 10 industries with the highest number of overall reports.  
  * Within those top industries, focus on reports specifically related to “Hospitalization.”  
* Provide insight into which industries are associated with the most serious events.

**Usage**:  
* Copy the file contents into the BigQuery Console.  
* Update the project/dataset references if needed.  
* Run **Query 1** to see industries with the highest report counts.  
* Run **Query 2** to see industries with the most hospitalization-related reports.

## Requirements / How to Run

1. **Database Connection**  
   * Ensure you have the proper access to BigQuery (or any other SQL environment).  
   * If using tools other than BigQuery, verify table and column names match.

2. **Adjust Table/Dataset Names**  
   * In each `.sql` file, look for references like `bigquery-public-data.new_york_citibike.*` or `your-project.warehouse_orders.*`.  
   * Replace them with your actual project, dataset, or table names if they differ.

3. **Execute the Queries**  
   * Open the `.sql` files or copy each query into your **Query Editor** (BigQuery or another SQL tool).  
   * Click **Run** (or use the equivalent command) to execute.  
   * Check the results in the output table or export them if needed.

## Feedback and Contributions

* If you encounter any issues or have suggestions for improvement, feel free to open an **Issue** on GitHub or contact us directly.  
* Pull requests are welcome! Please provide a clear description of your changes and their purpose.

---

> **Note**:  
> * Any sensitive data should be masked or removed before pushing to a public repository.  
> * These queries are primarily **examples** of SQL techniques for learning and demonstration purposes.  
> * Actual performance and best practices may vary depending on data volume, SQL dialect/version, and database architecture.

Thank you for visiting this repository! Dive into the `.sql` queries to explore how data from different sources can be analyzed and understood.
