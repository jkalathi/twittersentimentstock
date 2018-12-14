#Model 
stock <- read.csv('percentchanges.csv',header=T,sep=',')
stock$Date<-NULL
stock$Ds <- NULL

colnames(stock)


model1 <- lm(PercentChange ~.,data=stock)

model2 <- lm(PercentChange ~Company+AverageComment+AverageTweet+DJChange,data=stock)

model3 <- lm(PercentChange ~Company+AverageComment+AverageTweet+DJChange+previous_1
             +previous_2+previous_3+previous_4+previous_5,data=stock)

model4 <- lm(PercentChange ~Company+AverageComment+AverageTweet+DJChange+previous_1
             +previous_2+previous_3+previous_4+previous_5+VolumeTraded,data=stock)

model_final <- lm(PercentChange ~ Company+previous_1 +AverageComment+ 
                    AverageTweet +DJHigh + DJLow+ DJChange+VolumeTraded, data = stock)

summary(model_final)

##########################################################################################