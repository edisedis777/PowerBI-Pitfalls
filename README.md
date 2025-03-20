# PowerBI-Pitfalls

Welcome to the **PowerBI-Pitfalls** project! This repository demonstrates the top 5 Power BI pitfalls, as inspired by common issues in Power BI development (e.g., from articles like MSSQLTips ((see Credits)), using a provided sales dataset. For each pitfall, you’ll find examples of what not to do, how to fix it, and code to implement the solutions.

## Project Structure
- **`/data`**: Contains `SalesData.csv`.
- **`/queries`**: Power Query scripts (`TransformSalesData.m`).
- **`/dax`**: DAX measures (`Measures.dax`).
- **`/docs`**: Detailed guide (`PitfallsGuide.md`).

## Setup Instructions
1. **Clone the Repository**:
   - `git clone <repository-url>`
2. **Prepare the Dataset**:
   - Place `SalesData.csv` in the `/data` folder.
3. **Open Power BI Desktop**:
   - Launch Power BI Desktop (download from [Microsoft](https://powerbi.microsoft.com/) if needed).
4. **Load and Transform Data**:
   - Go to **Home** > **Get Data** > **Text/CSV** and select `data/SalesData.csv`.
   - Open **Power Query Editor**.
   - Create two queries (`DimCustomer` and `FactSales`) using the code from `queries/TransformSalesData.m`.
   - Click **Close & Apply**.
5. **Set Up the Data Model**:
   - In the **Model** view, create a relationship between `DimCustomer[UniqueID]` and `FactSales[UniqueID]`.
6. **Add DAX Measures**:
   - Go to the **Modeling** tab.
   - Add each measure from `dax/Measures.dax`.
7. **Create Visuals**:
   - Follow the examples in `docs/PitfallsGuide.md` to build visuals demonstrating each pitfall.

## Exploring the Project
- Read `docs/PitfallsGuide.md` for detailed explanations and examples.
- Use the Power BI file you create to compare wrong and right approaches interactively.

## Contributing
Feel free to submit pull requests with additional examples, optimizations, or corrections!

## Requirements
- Power BI Desktop (free version is sufficient).
- Basic understanding of Power Query and DAX.

## Credits
- Inspried by the article from Koen Verbeeck https://www.mssqltips.com/sqlservertip/8205/power-bi-common-pitfalls/

## License
This project is licensed under the MIT License. See the LICENSE file for details.

