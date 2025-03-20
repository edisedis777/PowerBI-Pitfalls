# PowerBI-Pitfalls
This repository demonstrates my notes on the top 5 Power BI pitfalls, as inspired by common issues in Power BI development (e.g., from articles like MSSQLTips (see Credits)), using a provided randomly gnerated sales dataset. For each pitfall, you’ll find examples of what not to do, how to fix it, and code to implement the solutions.

## Project Structure
- **`/data`**: Contains `SalesData.csv`.
- **`/queries`**: Power Query scripts (`TransformSalesData.m`).
- **`/dax`**: DAX measures (`Measures.dax`).
- **`/docs`**: Detailed guide (`PitfallsGuide.md`).
  
## Setup Instructions

### Clone the Repository:
- `git clone <repository-url>`

### Prepare the Dataset:
- Place `SalesData.csv` in the `/data` folder.

### Open Power BI Desktop:
- Launch Power BI Desktop (download from [Microsoft](https://powerbi.microsoft.com/) if needed).
  
### Load and Transform Data:
- Go to Home > Get Data > Text/CSV and select data/SalesData.csv.
- Open Power Query Editor.
- Create two queries (`DimCustomer` and `FactSales`) using the code from `queries/TransformSalesData.m`.
- Click Close & Apply.

## Set Up the Data Model:
In the Model view, create a relationship between DimCustomer[UniqueID] and FactSales[UniqueID].

### Add DAX Measures:
- Go to the Modeling tab.
- Add each measure from `dax/Measures.dax`.

### Create Visuals:
- Follow the examples in the detailed guide below to build visuals demonstrating each pitfall.

## Exploring the Project
- The detailed guide below provides in-depth explanations and examples for each pitfall.
- Use the Power BI file you create to compare wrong and right approaches interactively.

### Detailed Guide: Power BI Pitfalls and Best Practices
This section expands on the top 5 Power BI pitfalls, using the generated (from the geo profile generator project) SalesData.csv dataset to provide practical examples of what to avoid and how to improve your Power BI projects.

## Pitfall 1: Inefficient Data Modeling

**Explanation**
- Loading all data into a single table without proper modeling leads to redundancy, larger file sizes, and slower performance. A simple star schema with separate dimension and fact tables is more efficient!

**Wrong Way**
- Approach: Import the generated sample SalesData.csv as a single table without splitting customer and sales data.
- Issue: Duplicate customer information for each transaction increases file size and slows down queries.

**Right Way**
- Approach: Split the data into DimCustomer (unique customer info) and FactSales (transaction data) with a relationship on UniqueID.
- Benefit: Reduces redundancy and improves query performance.

### Code
See queries/TransformSalesData.m for the Power Query scripts that implement this split.

### Visual Demonstration
- Wrong Way: Create a table visual with all columns from the single table to show redundancy (e.g., repeated FirstName for each UniqueID).
- Right Way: Use the star schema and create a table with DimCustomer[FirstName] and FactSales[TotalAmount] to show efficient data usage.

## Pitfall 2: Poor DAX Usage
**Explanation**
- Inefficient or incorrect DAX measures can lead to slow reports or misleading results.

### Example 1: Filtering Sales
**Wrong Way:** Sales of Slippers Wrong
- Uses FILTER, which iterates over the entire table unnecessarily.
- Results in slower performance, especially with large datasets.

**Right Way:** Sales of Slippers 
- Uses CALCULATE with a direct filter, leveraging Power BI’s engine for efficiency.

### Example 2: Average Sales
**Wrong Way:** Average Transaction Amount
- Calculates the average of individual transactions, not per customer.
**Right Way:** Average Sales per Customer
- Averages total sales per customer correctly using AVERAGEX.

### Visual Demonstration
- Create two card visuals:
   - One with Sales of Slippers Wrong.
   - One with Sales of Slippers.
- Use Performance Analyzer to compare query times.
- Add a table visual with DimCustomer[UniqueID], Average Transaction Amount, and Average Sales per Customer to highlight the difference.

## Pitfall 3: Poor Visualization Choices
**Explanation**
- Choosing inappropriate visuals can make reports very hard to interpret or misleading.

### Example: Visualizing Purchase Types
**Wrong Way:** Pie chart with all PurchaseType values.
- Too many slices make it unreadable.

**Right Way:** Bar chart with top 5 PurchaseType by sales.
- Clear and focused on key data.

### Visual Demonstration
**Wrong Way:**
- Add a pie chart.
- Set PurchaseType as the legend and Total Sales as the value.
- Observe the cluttered result.

**Right Way:**
- Add a bar chart.
- Set PurchaseType on the axis, Total Sales as the value.
- Sort descending and apply a Top N Filter (Top 5 by Total Sales).

## Pitfall 4: Not Optimizing for Performance
**Explanation**
- Poor design choices, like complex DAX or excessive calculated columns, degrade report performance.

### Example: Calculating Total Sales

**Wrong Way:** Total Sales Slow
- Uses SUMX to multiply Price and Stuckzahl row-by-row, ignoring the pre-calculated TotalAmount.
- Slow due to unnecessary calculations.

**Right Way:** Total Sales Fast
- Uses the pre-calculated TotalAmount column for efficiency.

### Visual Demonstration
- Create two card visuals:
   - One with Total Sales Slow.
   - One with Total Sales Fast.
- Use Performance Analyzer to compare load times and show the performance difference.

## Pitfall 5: Inadequate Testing
**Explanation**
- Failing to validate calculations can lead to errors, especially with edge cases or filters!

### Example: Validating Average Sales
** Wrong Way:** Using Total Sales divided by total customers without checking for sales activity.
- Includes customers with no sales, skewing results.

**Right Way:** Validated Avg Sales per Customer
- Uses CustomersWithSales to ensure only active customers are counted.

### Visual Demonstration
- Create a table visual with:
   - DimCustomer[UniqueID].
   - Total Sales per Customer.
   - Validated Avg Sales per Customer.
- Add a slicer for PurchaseType and test edge cases (e.g., filter to a rare PurchaseType to ensure calculations hold).

### Conclusion
By applying these best practices, you can avoid common Power BI pitfalls, ensuring your reports are efficient, accurate, and user-friendly.

### Contributing
Feel free to submit pull requests with additional examples, optimizations, or corrections!

### Requirements
- Power BI Desktop (free version is sufficient).
- Basic understanding of Power Query and DAX.

### Credits
- Inspired by the article from Koen Verbeeck https://www.mssqltips.com/sqlservertip/8205/power-bi-common-pitfalls/
- Random sales data generated with my Geo Profile Generator script https://github.com/edisedis777/geo-profile-generator

### License
This project is licensed under the MIT License. See the LICENSE file for details.
