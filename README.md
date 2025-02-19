# DS-4002-MI3  
MI3 Repository - Group 7  

## Steam Review Sentiment Analysis and Gameplay Element Correlation  

### **Contents of this Repository**  
This repository contains the code, data, and output for our data science project analyzing Steam reviews to determine the relationship between **review sentiment, gameplay elements, and game ratings**. This project was completed as part of the **DS 4002** course at UVA.  

---

## **1. Software and Platform**  
- **Software:** Python, R  
- **Packages Used:**  
  - **Python:**  
    - `pandas`
    - `matplotlib`
    - `seaborn`
    - `scipy.stats`
    - `collections.Counter`
    - `nltk`
    - `spacy`
  - **R:**  
    - `tm`
    - `syuzhet`
    - `ggplot2`
    - `dplyr`
    - `data.table`
- **Platform:** Windows 10 / macOS Monterey / Ubuntu 20.04  

---

## **2. Documentation Map**  

📂 **Root Directory**  
  - `README.md` → This documentation file  
  - `LICENSE.md` → MIT License  

📂 **DATA/**  
  - `final_steam_reviews.csv` → Merged dataset with gameplay elements and sentiment scores
  - `steam_reviews_with_gameplay_elements.csv` → Processed dataset with gameplay element extraction
  - `sentiment_analysis_results.csv` → R sentiment analysis results  
  - `sentiment_data.csv` → Orginial sentiment scores
  - `truncated_data_cleaned.csv` → Orginial truncated data that was worked with

📂 **SCRIPTS/**  
  - `final_data_work.ipynb` → Python notebook performing statistical t-tests on sentiment scores and gameplay elements, as well as visualization. 
  - `clean_and_tokenize_data.ipynb` → Python notebook for Named Entity Recognition (NER) to extract gameplay elements  
  - `sentiment_analysis.R` → R script for sentiment analysis using `syuzhet`  
  - `visualizations.py` → Python script for sentiment and gameplay visualization  

📂 **OUTPUT/**  
  - Figures and charts from our visualizations  

---

## **3. Instructions for Reproducing Results**  

### **📝 1. Gameplay Element Extraction (Python)**
1. **Load the dataset** (`steam_reviews_english.csv` or `steam_reviews_with_gameplay_elements.csv`).
2. **Use Named Entity Recognition (NER) in Python** to extract gameplay-related terms such as "combat", "graphics", "story", etc.
3. **Filter out irrelevant terms** and categorize them under predefined gameplay elements.
4. **Save the updated dataset** as `steam_reviews_with_gameplay_elements.csv`.

### **📊 2. Sentiment Analysis (R)**
1. **Load the English-language Steam review dataset** into R. Take a random sample of **10,000** observations. Alternatively, use the pre-sampled dataset in the `DATA` folder.
2. **Convert the review text to a character vector**, clean the data by removing punctuation, numbers, and HTML formatting, and make all characters lowercase.
3. **Use the `syuzhet` package** to obtain sentiment scores using the NRC method. This will return sentiment values where positive numbers indicate positive sentiment and negative numbers indicate negative sentiment.
4. **Perform exploratory data analysis (EDA)** using `ggplot2` to visualize sentiment distribution.
5. **Perform a t-test**:
   - Split the dataset into **recommended** and **not recommended** reviews.
   - Run **t-tests** to determine if **recommended** reviews have a significantly positive sentiment and **not recommended** reviews have a significantly negative sentiment.
6. **Save the results** as `sentiment_analysis_results.csv`.

### **📈 3. Merging Sentiment Scores with Gameplay Elements (Python)**
1. **Load both `steam_reviews_with_gameplay_elements.csv` and `sentiment_analysis_results.csv`** into Python.
2. **Merge datasets on `review_id`**, ensuring that sentiment scores align with the correct reviews.
3. **Save the final dataset** as `final_steam_reviews.csv`.

### **🎨 4. Visualizations (Python)**
1. **Generate sentiment distribution histograms** to check the balance between positive and negative reviews.
2. **Create bar charts of the most frequently mentioned gameplay elements**.
3. **Visualize sentiment scores by gameplay element** using box plots.
4. **Compare recommendation rates by gameplay element** using bar charts.
5. **Save all figures in the `OUTPUT` folder**.

### **📊 5. Statistical Analysis - T-Tests (Python)**
1. **Run one-sample t-tests** to test whether the mean sentiment score for reviews mentioning each gameplay element differs significantly from **neutral (0)**.
2. **Run two-sample t-tests**:
   - Compare **sentiment scores** for reviews mentioning a specific gameplay element vs. those that don’t.
   - Compare **positive review rates** (proportion of reviews with sentiment > 0) between these two groups.
3. **Interpret the results**:
   - If p < 0.05, the presence of the gameplay element has a **statistically significant** impact on review sentiment.
   - If p > 0.05, the element **does not significantly** affect sentiment.
4. **Print and save statistical results**.

---

## **4. Citations**  

### **Sentiment Analysis**
- Bobbitt, “How to Select Random Samples in R (With Examples),” *Statology*, Oct. 22, 2020. [Link](https://www.statology.org/random-sample-in-r/)
- ben_aaron, “Removing characters from string in R,” *Stack Overflow*, Nov. 20, 2014. [Link](https://stackoverflow.com/questions/27044727/removing-characters-from-string-in-r)
- M. Jockers, “Introduction to the Syuzhet Package,” *R-project.org*, Dec. 13, 2017. [Link](https://cran.r-project.org/web/packages/syuzhet/vignettes/syuzhet-vignette.html)

### **Statistical Methods**
- Student’s t-test: [Wikipedia](https://en.wikipedia.org/wiki/Student%27s_t-test)
- Independent Two-Sample t-test: [Scipy Docs](https://docs.scipy.org/doc/scipy/reference/generated/scipy.stats.ttest_ind.html)

---

## **5. Summary**
This project examines how different **gameplay elements impact review sentiment** on Steam. By combining **Named Entity Recognition (NER)** with **sentiment analysis** and **statistical hypothesis testing**, we:
- Extracted **gameplay elements** from reviews.  
-  Measured **sentiment scores** using `syuzhet` in R.  
-  Performed **t-tests** to analyze whether gameplay elements correlate with positive or negative reviews.  
-  Created **data visualizations** to display relationships.  

Our results highlight which game elements contribute most to **positive or negative reviews** and provide **data-driven insights** into player preferences.

**Team 7, The Unsupervised Learners - DS 4002**
