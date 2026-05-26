import pandas as pd
import numpy as np
# Step 1: Creating a deliberately dirty dataset
data = {
    'House_ID': [101, 102, 103, 104, 105, 102, 106, 107],
    'Price': [250000, 300000, np.nan, '400000', 350000, 300000, 500000, 100000],
    'Bedrooms': [3, 4, 3, 5, np.nan, 4, 3, 2],
    'Area_sqft': ['1500', '2000', 'Unknown', '2500', '2200', '2000', '3000', '1000']
}
df = pd.DataFrame(data)
print("--- Raw DATA ---")
print(df)

# Step 2: Check the datatypes and find count of missing values
# Convert dtype into numeric so that we can perform operations
print("\n--- DIAGNOSIS ---")
print("Data types:\n", df.dtypes)
# Check for missing values
print("\nMissing values count:\n", df.isnull().sum())
# Check for exact duplicates
print("\nDuplicate Rows:", df.duplicated().sum())

# Step 3: Fix the Data Types
# Convert Price to numeric
df['Price'] = pd.to_numeric(df['Price'], errors='coerce')
# Convert 'Area_sqft' - replace 'Unknown' with NaN, then convert to numeric
df['Area_sqft'] = df['Area_sqft'].replace('Unknown', np.nan)
df['Area_sqft'] = pd.to_numeric(df['Area_sqft'], errors='coerce')
print("\n--- CLEANING TYPES ---")
print(df.dtypes)

# Step 4: Remove Duplicates
# (Remove duplicate rows before you impute missing values,
# keep the first instance, drop the rest)
print("\n--- Handling Duplicates ---")
df = df.drop_duplicates(keep='first')
print(df)

# Step 5: Handling Missing Values
print("\n--- Handling Missing VALS ---")
price_median = df['Price'].median()
df['Price'] = df['Price'].fillna(price_median)
area_mean = df['Area_sqft'].mean()
df['Area_sqft'] = df['Area_sqft'].fillna(area_mean)
bedroom_median = df['Bedrooms'].median()
df['Bedrooms'] = df['Bedrooms'].fillna(bedroom_median)
print("\n--- FINAL CLEANED DATA ---")
print(df)
print("\nFinal Data Types:\n", df.dtypes)
print("\nFinal Missing values:\n", df.isnull().sum())
