
#installing the package to run sentmental analysis for stock data
install.packages('SentimentAnalysis')
library(SentimentAnalysis)
library(dplyr)

#loading the comments file
comment_score <- read.csv('stockComments.csv',header=TRUE,sep=",")

#calculating the sentiment scores of comments
l = ''
j=1
for (i in comment_score$Tweet){
  l=''
  l <- analyzeSentiment(i, language='english')
  comment_score$LMScore[j] <- l$SentimentLM
  comment_score$GeneralScore[j] <- l$SentimentGI
  print(j)
  j=j+1
}
#writing the sentiment score to csv
write.csv(comment_score, 'CommentScore.csv')
#######################################################################################

#loading the tweet file
tweet_score <- read.csv('stocktweets.csv',header=T,sep=',')

#calculating the sentiment scores of tweetes
l = ''
j=1
for (i in tweet_score$Tweet){
  l=''
  l <- analyzeSentiment(i, language='english')
  tweet_score$LMScore[j] <- l$SentimentLM
  tweet_score$GeneralScore[j] <- l$SentimentGI
  print(j)
  j=j+1
}
#writing the sentiment score to csv
write.csv(comment_score, 'TweetScore.csv')
#########################################################################################
