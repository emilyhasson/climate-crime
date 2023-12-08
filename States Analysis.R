raw_data<-read.csv("StatesData.csv")
head(raw_data)
data(state)
stateData<-data.frame(state.x77,row.names = state.abb)

head(stateData)

data <- raw_data
data$Frost = stateData$Frost
head(data)


hist(data$AvgTemp, labels = TRUE, ylim=c(0,15), xlab="Average Temperature", col="salmon")
which.min(data$AvgTemp)
# Alaska might be an outlier.

hist(data$ClearDays, labels=TRUE, ylim=c(0, 20), xlab="Num. Clear Days per Year", col="lightgreen")
data[which.max(data$ClearDays),]

hist(data$Precip, labels=TRUE, ylim=c(0,20), xlab="Precipitation in Inches", col="steelblue1")

hist(data$Crime, labels=TRUE, ylim=c(0,20), xlab="Crime Rate", col="plum")
data[which.max(data$Crime),]
# Once again, Alaska appears to be somewhat of an outlier
data[which(data$Crime > 700),]

hist(data$Population, labels=TRUE)
data[which.max(data$Population),]

hist(data$LandArea, labels=TRUE, ylim=c(0,50), xlab = "Land Area", col="mistyrose")
# Alaska yet again

hist(data$Income, labels=TRUE, col = "mediumpurple3", ylim = c(0,15), xlab = "Median Income")
hist(data$Frost, labels=TRUE, col="aquamarine", ylim=c(0,15), xlab="Num. Days Below Freezing")
hist(data$Density, labels=TRUE, ylim=c(0,50), xlab = "Population Density", col="mistyrose")

data$Density = data$Population / data$LandArea
head(data)
data[which.max(data$Density),]
data

cor(data[,-1], method="pearson", use= "complete.obs")

#probit.mod <- glm(Crime ~ AvgTemp + ClearDays + Precip 
#                  + Population + LandArea + Income + Frost 
#                  + Density, data = data, family = binomial)

# replace land area and population with density
mod <- lm(Crime ~ AvgTemp + ClearDays + Precip 
          + Income + Frost 
          + Density, data = data)
summary(mod)

# here, frost and income are the most important factors. What happens if we remove income?
mod2 <- lm(Crime ~ AvgTemp + ClearDays + Precip 
           + Frost 
          + Density, data = data)
summary(mod2)


# variable selection:
mod <- lm(Crime ~ AvgTemp + ClearDays 
          + Income + Frost, data = data)
summary(mod)

m <- lm(Crime ~ ClearDays, data = data)
plot(data$ClearDays, data$Crime)
abline(m)
#text(data$ClearDays, data$Crime-1, labels=data$State)

m <- lm(Crime ~ Income, data = data)
plot(data$Income, data$Crime)
abline(m)
#text(data$Income, data$Crime-1, labels=data$State)

m <- lm(Crime ~ Frost, data = data)
plot(data$Frost, data$Crime)
abline(m)

m <- lm(Crime ~ AvgTemp, data = data)
plot(data$AvgTemp, data$Crime)
abline(m)

#the final model here contains (in order of significance): Clear days, Income, Frost, and AvgTemp




# consider leverages for outliers

hats <- as.data.frame(hatvalues(mod))
hats


new_data <- data.frame(AvgTemp=seq(min(data$AvgTemp), max(data$AvgTemp), len=50),
                       ClearDays = median(data$ClearDays),
                       Income = median(data$Income),
                       Frost = median(data$Frost))
new_data$Crime = predict(mod, new_data, type="response")
plot(Crime ~ AvgTemp, data=new_data, col="lightblue", ylim=c(0,1000), ylab="")
lines(Crime ~ AvgTemp, new_data, lwd=2)

new_data <- data.frame(ClearDays=seq(min(data$ClearDays), max(data$ClearDays), len=50),
                       AvgTemp = median(data$AvgTemp),
                       Income = median(data$Income),
                       Frost = median(data$Frost))
new_data$Crime = predict(mod, new_data, type="response")
plot(Crime ~ ClearDays, data=new_data, col="lightblue", ylim=c(0,1000), ylab="")
lines(Crime ~ ClearDays, new_data, lwd=2)




mod <- lm(Crime ~ (AvgTemp*ClearDays) + ClearDays 
          + Income, data = data)
summary(mod)

new_data <- data.frame(AvgTemp=seq(min(data$AvgTemp), max(data$AvgTemp), len=50),
                       ClearDays = median(data$ClearDays),
                       Income = median(data$Income))
new_data$Crime = predict(mod, new_data, type="response")
plot(Crime ~ AvgTemp, data=new_data, col="lightpink", ylim=c(0,1000), ylab="Crime Rate", xlab="Average Temperature", main="Average Temperature and Violent Crime")
lines(Crime ~ AvgTemp, new_data, lwd=2)

new_data <- data.frame(ClearDays=seq(min(data$ClearDays), max(data$ClearDays), len=50),
                       AvgTemp = median(data$AvgTemp),
                       Income = median(data$Income))
new_data$Crime = predict(mod, new_data, type="response")
plot(Crime ~ ClearDays, data=new_data, col="lightblue", ylim=c(0,1000), ylab="Crime Rate", xlab = "# Clear Days per Year", main="Clear Days and Violent Crime")
lines(Crime ~ ClearDays, new_data, lwd=2)

new_data <- data.frame(Income=seq(min(data$Income), max(data$Income), len=50),
                       AvgTemp = median(data$AvgTemp),
                       ClearDays = median(data$ClearDays))
new_data$Crime = predict(mod, new_data, type="response")
plot(Crime ~ Income, data=new_data, col="salmon", ylim=c(0,1000), xlab = "Meidan Income", ylab="Violent Crime Rate", main="Income and Violent Crime")
lines(Crime ~ Income, new_data, lwd=2)

## Try plotting interaction

new_data <- data.frame(AvgTemp=seq(min(data$AvgTemp), max(data$AvgTemp), len=50),
                       ClearDays = max(data$ClearDays),
                       Income = median(data$Income))
new_data$Crime = predict(mod, new_data, type="response")
plot(Crime ~ AvgTemp, data=new_data, col="white", ylim=c(0,1000), ylab="Crime Rate", xlab="Average Temperature", main="Average Temperature with Many Clear Days")
lines(Crime ~ AvgTemp, new_data, lwd=2, col="purple")

new_data <- data.frame(AvgTemp=seq(min(data$AvgTemp), max(data$AvgTemp), len=50),
                       ClearDays = min(data$ClearDays),
                       Income = median(data$Income))
new_data$Crime = predict(mod, new_data, type="response")
plot(Crime ~ AvgTemp, data=new_data, col="white", ylim=c(0,1000), ylab="Crime Rate", xlab="Average Temperature", main="Average Temperature with Few Clear Days")
lines(Crime ~ AvgTemp, new_data, lwd=2, col="blue")

# leverages looked fine, but try removing Alaska anyways because it was sus
f <-data[-c(2),]
f

mod <- lm(Crime ~ AvgTemp + ClearDays 
          , data = f)
summary(mod)

# this model contains only avgtemp and clear days (income removed). try keeping income

mod <- lm(Crime ~ AvgTemp + ClearDays
          + Income + Frost 
        , data = data)
summary(mod)

# ends up the same, so Alaska need not be removed (long route of checking leverages)

# consider trying elastic net, lasso, and ridge regression
