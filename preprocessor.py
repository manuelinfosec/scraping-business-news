import pandas as pd

# Read the scraped data from the "news.csv" file into a Pandas DataFrame
data: pd.DataFrame = pd.read_csv("news.csv")

# Remove the "index" column as it's not needed for further analysis
data: pd.DataFrame = data.drop("index", axis=1)

# Clean the "date" column by removing leading spaces
data["date"]: pd.Series = data["date"].str.lstrip()

# Save the preprocessed data to a new CSV file named "stock_news.csv" with index included
data.to_csv("stock_news.csv", index=True)
