# R Scripts for Data Analysis

Welcome to this repository, which contains several **R scripts** used for data analysis and visualization. Below is an overview of the different code snippets or scripts you might have, along with a brief description and usage instructions.

## 1. Analyzing Excel Data (Survey / CLDV Sheet)

**Purpose**  
* Reads Excel data (sheet named `"CLDV"`) starting at a specific row.  
* Renames columns (`CL1` to `CL5`), reshapes data to a long format (using `tidyr`), and computes frequency for each rating.  
* Visualizes average frequency across different ratings (e.g., 1 to 5) using a line chart limited to `y = 0..200`.  

**Key Steps**  
* Install and load required libraries (`readxl`, `dplyr`, `tidyr`, `ggplot2`).  
* Use `read_excel()` to load data from a specified path and sheet.  
* Reshape data with `pivot_longer()`.  
* Summarize frequencies using `group_by()` and `summarise()` from **dplyr**.  
* Plot results with **ggplot2** (`geom_line()`).  

**Usage**  
1. Update the file path to match your local Excel file.  
2. Run each code block in R or RStudio.  
3. Inspect the output data frames and the generated plots in the Plots pane.

## 2. Demographic Analysis (Gender, Education, Goals)

**Purpose**  
* Reads an Excel file and explores columns like `"GIOITINH"` (Gender), `"TRINH DO HIEN TAI"` (Current Level of Education), `"MUC TIEU"` (Goals), and more.  
* Uses **ggplot2** to create pie charts showing distribution (percentage) of each category.  

**Key Steps**  
* Load data with `read_excel()`.  
* Summarize categories with `table()` and calculate percentages.  
* Plot pie charts by converting bars to polar coordinates with `coord_polar(theta="y")`.  

**Usage**  
1. Ensure the file path is set correctly for your dataset.  
2. Run the script; pie charts will appear in the RStudio Plots pane (or your graphics device).  
3. Adjust labels, titles, or themes as needed.

## 3. Book Reviews Analysis (Excel or CSV)

**Purpose**  
* Reads data about books (e.g., from an Excel sheet or `"bestsellers with categories.csv"`) to analyze reviews, price distributions, or user ratings.  
* Demonstrates summarizing data (`summarise`, `group_by`) and plotting histograms/density curves.  
* Identifies the most-reviewed books and creates bar charts for the top 10.  

**Key Steps**  
* Load data with `read_excel()` or `read.csv()`.  
* Use **dplyr** to group books by `Name` or `Author`, then sum or count relevant columns.  
* Shorten long book titles, if needed, for chart readability.  
* Visualize distributions using **ggplot2** histograms (`geom_histogram`) and density plots (`geom_density`).  

**Usage**  
1. Edit the paths pointing to your local CSV/Excel files.  
2. Run each code block in R or RStudio to see the outputs (summaries, plots).  
3. Check the console output and Plots pane for final results.

## Requirements / How to Run

1. **R Environment**  
   * Make sure you have **R** and **RStudio** (or another R IDE) installed.  
   * Packages used include `readxl`, `dplyr`, `tidyr`, `ggplot2`. Install any missing packages via `install.packages("package_name")`.

2. **Adjust File Paths**  
   * In each script/code block, look for lines like `read_excel("D:/#TÀI LIỆU/...")` or `read.csv("D:/bestsellers with categories.csv")`.  
   * Replace them with your actual paths to the data files if they differ.

3. **Run the Scripts**  
   * Open each `.R` file (or code snippet) in RStudio.  
   * Execute line by line or as a whole script.  
   * Check the console for logs and the Plots pane for generated visualizations.

## Feedback and Contributions

* If you find any issues or have suggestions for improvement, feel free to open an **Issue** on GitHub or contact us directly.  
* Pull requests are welcome! Please include a clear description of the changes and their purpose.

---

> **Note**:  
> * Any sensitive data (file paths, personal information) should be sanitized before pushing to a public repository.  
> * These R scripts serve as **examples** of using the tidyverse (e.g., dplyr, tidyr) and ggplot2 for data manipulation and visualization.  
> * Performance may vary depending on the size of your data, so consider optimizing code or sampling large datasets.

Thank you for exploring these R scripts! We hope they help demonstrate practical data analysis and visualization techniques in R.
