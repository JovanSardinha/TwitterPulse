library(ROAuth)
library(streamR)

library("ROAuth")
library("twitteR")
library("wordcloud")
library("tm")
load('my_oauth.RData')
registerTwitterOAuth(my_oauth)
load(file = 'data/pos_words.RData')
load(file = 'data/neg_words.RData')

get_sentiment = function(txt) {
  words = strsplit(txt, ' +')
  words = unlist(words)
  pos_matches = match(words, pos)
  neg_matches = match(words, neg)
  
  #count all the mapped positive and negative words and subtract the latter from the former
  score = sum(!is.na(pos_matches)) - sum(!is.na(neg_matches))
  return(score)
}



computeSentiment<-function(tweets){
  sentiment = sapply(tweets,get_sentiment)
  return(sentiment)
}

plotwordCloud<-function(text){
  wordcloud(text,colors=brewer.pal(8, "Dark2"))
  
}


search_twitter<-function(text){

rawtweets<- searchTwitter(text, n=199)

tweets<-sapply(rawtweets,function(x) x$getText())

return(tweets)
}






