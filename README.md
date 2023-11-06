# Scraping News Headlines

## Introduction

The code presented in this documentation aims to scrape news headlines from the [Vanguard Business](https://www.vanguardngr.com/category/business) website, and preprocesses the scraped data.

## Code Overview

The code is written in R and leverages the `tidyverse` and `rvest` libraries. These libraries provide powerful tools for data manipulation and web scraping, making it possible to extract news headlines and dates from multiple pages of the [Vanguard Business](https://www.vanguardngr.com/category/business) website.

Preprocessing was performed in Python using Pandas DataFrames.

### Data Structure

To organize the scraped data, we create an empty data frame named `scraped_data` with three columns:

1. `index`: An integer representing the page number from which the data is scraped.
2. `news`: A character vector that stores the news headlines.
3. `date`: A character vector that stores the dates associated with the news headlines.

The scraped dataset consists of 1886 rows and three data.

### Web Scraping Process

1. **Loop Over Multiple Pages:**
   The code scrapes data from multiple pages of the Vanguard Business website. It uses a `for` loop to iterate through page numbers from 1 to 1747. The URL of each page is constructed dynamically using the `paste0` function.

2. **Read HTML Content:**
   For each page, the code reads the HTML content using the `read_html` function from the `rvest` library. This content represents the web page's structure, including news headlines and dates.

3. **Extract News Headlines:**
   Using CSS selectors, the code extracts the text content of news headlines from the HTML. Specifically, it targets elements with the class "entry-title a" and retrieves the text using the `html_nodes` and `html_text` functions. The headlines are stored in the `temp` variable.

4. **Extract Dates:**
   Similarly, the code extracts the date information from the HTML elements with the class "entry-date." It removes spaces from the extracted date using the `gsub` function.

5. **Create Data Frame:**
   For each page, a data frame (`page_data`) is created to store the page index, news headlines, and dates.

6. **Append Data:**
   The data from the current page is appended to the overall `scraped_data` data frame using the `rbind` function.

7. **Writing to CSV:**
   After scraping data from all the pages, the code writes the `scraped_data` data frame to a CSV file named "prices.csv" using the `write.csv` function. Row names are excluded from the CSV to keep the data clean.

## Preprocessing In Python

The preprocessing is performed using the Pandas library in Python. The primary goals of this preprocessing are to remove unnecessary data, clean the date column, and save the cleaned data to a new CSV file. The preprocessing step majorly consisted of reordering the indexes and stripping the extra spaces in the date that wasn't efficiently done in R.



## Conclusion

The code successfully scrapes news headlines and associated dates from the Vanguard Business website, organizing the data into a structured format. This approach demonstrates how web scraping can be used to collect data from web pages efficiently. It provides a foundation for further analysis, research, or archiving of news headlines from the website.