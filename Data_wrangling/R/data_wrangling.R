library(dplyr)
library(tidyr)

# Step 1: Create synthetic data
set.seed(123)
df <- tibble(
  ID = 1:10,
  Name = c("Alice", "Bob", "Charlie", "David", "Eva", "Frank", "Grace", "Hannah", "Ian", "Jane"),
  Age = sample(18:60, 10, replace = TRUE),
  Gender = sample(c("Male", "Female"), 10, replace = TRUE),
  Salary = sample(30000:80000, 10, replace = TRUE)
)

print("Original DataFrame:")
print(df)

# Step 2: Data Wrangling Operations

# 2.1 Filter rows where Age > 30
filtered_df <- df %>% filter(Age > 30)
print("\nFiltered DataFrame (Age > 30):")
print(filtered_df)

# 2.2 Select columns 'Name' and 'Age'
selected_columns <- df %>% select(Name, Age)
print("\nSelected Columns (Name and Age):")
print(selected_columns)

# 2.3 Add a new column 'AgeGroup' based on 'Age'
df <- df %>% mutate(AgeGroup = if_else(Age > 18, "Adult", "Child"))
print("\nDataFrame with New Column (AgeGroup):")
print(df)

# 2.4 Summarize by grouping Gender and calculating mean Age
summary <- df %>% group_by(Gender) %>% summarize(mean_age = mean(Age, na.rm = TRUE))
print("\nSummary (Mean Age by Gender):")
print(summary)

# 2.5 Sort by Age in descending order
sorted_df <- df %>% arrange(desc(Age))
print("\nSorted DataFrame (Age Descending):")
print(sorted_df)

# 2.6 Handle missing values
df$Salary[2] <- NA  # Introduce a missing value
df <- df %>% mutate(Salary = if_else(is.na(Salary), mean(Salary, na.rm = TRUE), Salary))
print("\nDataFrame After Handling Missing Values (Fill Salary with Mean):")
print(df)

# 2.7 Merge with another DataFrame
df2 <- tibble(
  ID = c(1, 2, 3, 4, 5),
  Department = c("HR", "Finance", "IT", "Marketing", "Sales")
)
merged_df <- df %>% left_join(df2, by = "ID")
print("\nMerged DataFrame:")
print(merged_df)

# 2.8 Pivot DataFrame
pivot_df <- df %>% pivot_wider(names_from = AgeGroup, values_from = Salary, values_fn = mean)
print("\nPivoted DataFrame:")
print(pivot_df)

