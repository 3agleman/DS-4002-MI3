# GUIDE USED: https://www.r-bloggers.com/2021/05/sentiment-analysis-in-r-3/

data<-read.csv("steam_reviews_english.csv")

# Getting a random sample of 10000 reviews for manageability

data<- data[sample(nrow(data), size = 10000), ]

# Loading the review texts as a Corpus
library(tm)
corpus1<-iconv(data$review)

# Cleaning the review texts
corpus1<-tolower(corpus1)
corpus1<-removePunctuation(corpus1)
corpus1<-removeNumbers(corpus1)
corpus1<-gsub('\n','', corpus1)

# Perform sentiment analysis
library(syuzhet)

# Get sentiment scores using the NRC method 
#(negative is negative sentiment, positive is positive sentiment)

data$review_sentiment<-get_sentiment(corpus1)

# Plot distribution of sentiments
library(ggplot2)

sentiments<-ggplot(data)+
  geom_histogram(aes(x = review_sentiment))
sentiments

library(dplyr)
data<-data%>%
  mutate(polar = ifelse(review_sentiment > 0, "positive", "negative"))%>%
  mutate(polar = ifelse(review_sentiment == 0, "neutral", polar))

pos<-sum(data$polar == "positive")
neg<-sum(data$polar == "negative")
neu<-sum(data$polar == "neutral")
sentiments_c<-c(pos, neg, neu)

datarec<-ifelse(data$recommended == "True", T, F)
data$recommended<-datarec
rec<-sum(data$recommended)
notrec<-10000-rec
recommended_c<-c(rec, notrec, NA)

# Compare recommendations to sentiments
data.table(recommended_c, sentiments_c)

# T-tests

# Split data into recommended and not recommended games to test hypotheses
recommendedGames<-data[data$recommended == T, ]
notRecommendedGames<-data[data$recommended == F, ]

t.test(recommendedGames$review_sentiment, alternative = "greater", mu = 0 )
# Appear to solidly reject our null hypothesis (that the mean sentiment for recommended games is negative or neutral)

t.test(notRecommendedGames$review_sentiment, alternative = "less", mu = 0 )
# In this case, we cannot reject our null hypothesis (that the mean sentiment for not recommended games is positive or neutral). 
# Upon further inspection, some reviews appear to not recommend the game
# despite praising certain elements of gameplay, which may be contributing to this result.

# RESOURCES USED: 
# https://www.statology.org/random-sample-in-r/
# https://stackoverflow.com/questions/27044727/removing-characters-from-string-in-r
# https://cran.r-project.org/web/packages/syuzhet/vignettes/syuzhet-vignette.html