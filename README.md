# DS-4002-MI3
MI3 Repository - Group 7

# Steam Review Sentiment Analysis and Gameplay Element Correlation

## Contents of this Repository

This repository contains the code, data, and output for our data science project analyzing Steam reviews to determine the relationship between review sentiment, gameplay elements, and game ratings.  This project was completed as part of the DS 4002 course at UVA

## 1. Software and Platform

*   **Software:** Python, R
*   **Packages:**
    *   pandas
    *   [placeholder for any new packages]
*   **Platform:**  [Specify your OS, e.g., Windows 10, macOS Monterey, Ubuntu 20.04]

## 2. Documentation Map

## 3. Instructions for Reproducing Results

### Sentiment Analysis
1. Load in the english language Steam review data into R. Take a random sample of 10000 observations. Alternatively, use our random sample data in our DATA folder.
2. Convert the review text data to a character vector. Clean the data by removing punctuation and numbers and making all the characters lowercase. Remove all page/line breaks and other HTML syntax.
3. Load the syuzhet package, which contains functions for getting sentiment estimates. Get sentimates for your cleaned text data using the NRC method, which should give you a vector of doubles which are positive/negative depending on sentiment. Perform any EDA or other visualization on these results as needed. 
4. Finally, perform a t-test by splitting the data into a set of all reviews marked "recommended" and all reviews marked "not recommended". Run a t-test on each of these sets, with the alternative being (average sentiment) is greater than zero for the former and less than zero for the latter. 

## Citations

### Sentiment Analysis
Bobbitt, “How to Select Random Samples in R (With Examples),” Statology, Oct. 22, 2020. https://www.statology.org/random-sample-in-r/

ben_aaron, “Removing characters from string in R,” Stack Overflow, Nov. 20, 2014. https://stackoverflow.com/questions/27044727/removing-characters-from-string-in-r

M. Jockers, “Introduction to the Syuzhet Package,” R-project.org, Dec. 13, 2017. https://cran.r-project.org/web/packages/syuzhet/vignettes/syuzhet-vignette.html
