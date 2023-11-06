# Load the necessary libraries
library(tidyverse)  # Load the 'tidyverse' package for data manipulation
library(rvest)      # Load the 'rvest' package for web scraping

# Initialize empty data frame to store the scraped data
scraped_data = data.frame(index = integer(0), news = character(0), date = character(0))

# Scraping multiple pages (from page 1 to 1747)
for (i in 1:1747) {
  # Generate the URL for the current page
  page_url = paste0("https://www.vanguardngr.com/category/business/page/", i)
  
  # Read the HTML content of the current page
  site_to_scrap = read_html(page_url)
  
  # Extract the text content from the HTML elements with class "entry-title a"
  temp = site_to_scrap %>%
    html_nodes(".entry-title a") %>%
    html_text()

  # Extract the date text
  date = site_to_scrap %>%
    html_nodes(".entry-date") %>% 
    html_text()

  # Remove spaces from the date text
  date = gsub(" ", "", date)
  
  # Create a data frame for the current page's data
  page_data = data.frame(index = i, news = temp, date = date)
  
  # Append the data for the current page to the overall scraped_data
  scraped_data = rbind(scraped_data, page_data)
}

# Write the scraped content to a CSV file named "prices.csv" without row names
write.csv(scraped_data, file = "prices.csv", row.names = FALSE)
