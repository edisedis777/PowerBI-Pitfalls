This folder contains the PowerBI scripts to transform the raw CSV file into a star schema. 

Usage Instructions:

- Open Power BI Desktop.
- Go to Home > Get Data > Text/CSV and load SalesData.csv.
- Open the Power Query Editor.
- Create two new queries by copying each section above into separate blank queries named DimCustomer and FactSales.
- Click Close & Apply to load the data into the model.
- In the Model view, create a one-to-many relationship between DimCustomer[UniqueID] (one side) and FactSales[UniqueID] (many side).
