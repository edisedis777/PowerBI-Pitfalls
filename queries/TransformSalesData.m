// DimCustomer - Customer dimension table
let
    Source = Csv.Document(File.Contents("SalesData.csv"), [Delimiter=",", Columns=18, Encoding=1252]),
    #"Changed Type" = Table.TransformColumnTypes(Source, {
        {"UniqueID", type text}, {"Salutation", type text}, {"FirstName", type text}, {"LastName", type text},
        {"AddressZipCity", type text}, {"Address", type text}, {"Telephone", type text}, {"Email", type text},
        {"GeoLat", type number}, {"GeoLon", type number}, {"Birthday", type date}, {"Price", type number},
        {"Stuckzahl", Int64.Type}, {"SalesTax", type number}, {"PurchaseType", type text},
        {"TaxAmount", type number}, {"TotalPrice", type number}, {"TotalAmount", type number}
    }),
    #"Removed Duplicates" = Table.Distinct(#"Changed Type", {"UniqueID"}),
    #"Selected Columns" = Table.SelectColumns(#"Removed Duplicates", {
        "UniqueID", "Salutation", "FirstName", "LastName", "AddressZipCity", "Address", "Telephone", "Email", "GeoLat", "GeoLon", "Birthday"
    })
in
    #"Selected Columns"

// FactSales - Sales fact table
let
    Source = Csv.Document(File.Contents("SalesData.csv"), [Delimiter=",", Columns=18, Encoding=1252]),
    #"Changed Type" = Table.TransformColumnTypes(Source, {
        {"UniqueID", type text}, {"Salutation", type text}, {"FirstName", type text}, {"LastName", type text},
        {"AddressZipCity", type text}, {"Address", type text}, {"Telephone", type text}, {"Email", type text},
        {"GeoLat", type number}, {"GeoLon", type number}, {"Birthday", type date}, {"Price", type number},
        {"Stuckzahl", Int64.Type}, {"SalesTax", type number}, {"PurchaseType", type text},
        {"TaxAmount", type number}, {"TotalPrice", type number}, {"TotalAmount", type number}
    }),
    #"Selected Columns" = Table.SelectColumns(#"Changed Type", {
        "UniqueID", "Price", "Stuckzahl", "SalesTax", "PurchaseType", "TaxAmount", "TotalPrice", "TotalAmount"
    })
in
    #"Selected Columns"
