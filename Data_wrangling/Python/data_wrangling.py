import pandas as pd
import numpy as np

# Step 1: Create synthetic data
data = {
    "ID": range(1, 11),
    "Name": ["Alice", "Bob", "Charlie", "David", "Eva", "Frank", "Grace", "Hannah", "Ian", "Jane"],
    "Age": np.random.randint(18, 60, size=10),
    "Gender": np.random.choice(["Male", "Female"], size=10),
    "Salary": np.random.randint(30000, 80000, size=10),
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Step 2: Data Wrangling Operations

# 2.1 Filter rows where Age > 30
filtered_df = df[df['Age'] > 30]
print("\nFiltered DataFrame (Age > 30):")
print(filtered_df)

# 2.2 Select columns 'Name' and 'Age'
selected_columns = df[['Name', 'Age']]
print("\nSelected Columns (Name and Age):")
print(selected_columns)

# 2.3 Add a new column 'AgeGroup' based on 'Age'
df['AgeGroup'] = df['Age'].apply(lambda x: 'Adult' if x > 18 else 'Child')
print("\nDataFrame with New Column (AgeGroup):")
print(df)

# 2.4 Summarize by grouping Gender and calculating mean Age
summary = df.groupby('Gender').agg({'Age': 'mean'}).reset_index()
print("\nSummary (Mean Age by Gender):")
print(summary)

# 2.5 Sort by Age in descending order
sorted_df = df.sort_values('Age', ascending=False)
print("\nSorted DataFrame (Age Descending):")
print(sorted_df)

# 2.6 Handle missing values (example)
df.loc[2, 'Salary'] = None  # Introduce a missing value
df['Salary'] = df['Salary'].fillna(df['Salary'].mean())
print("\nDataFrame After Handling Missing Values (Fill Salary with Mean):")
print(df)

# 2.7 Merge with another DataFrame
df2 = pd.DataFrame({
    "ID": [1, 2, 3, 4, 5],
    "Department": ["HR", "Finance", "IT", "Marketing", "Sales"]
})
merged_df = pd.merge(df, df2, on='ID', how='left')
print("\nMerged DataFrame:")
print(merged_df)

# 2.8 Pivot DataFrame
pivot_df = df.pivot_table(index='Gender', columns='AgeGroup', values='Salary', aggfunc='mean')
print("\nPivoted DataFrame:")
print(pivot_df)
