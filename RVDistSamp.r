library(gtools)
install.packages("moments")
library(moments)

#Generate N=15 independent binomial random variables with n=5 trials and probability p=.6
rbinom(15, 5,.6 ) ## this means that out of 5 trials we either get a success or we do not with a probability of 0.6

#What if we up the probability to p=0.99 for getting a success?

rbinom(15, 5,.99 )

# Probability distribution
#Generate a sample of N=10,000 with n=7 trials and a probability of success p=.3
X=rbinom(10000,7, .3)

#X
# Barplot of the probability distribution 
## Why barplot and not a histogram??
# If I sample 10,000 numbers from Bin(n=7, p=.3), what does the distribution look like?
barplot(table(X))


##distribution: this gives you the probability of x=0,1,2,3,4,5,6,7
dbinom(0:7, 7, .3)
#note: these outputs are between 0 and 1 and are probabilities! ie) a single point/outcome has probability

#check our assumption that the probabilities sum to 1!
sum(dbinom(0:7, 7, .3))


#Example: What is the probability of exactly 2 successes (P(X=2)) for a binomial distribution Bin(n=7, p=.3)? 
dbinom(2,7,.3) #calculate using R
#choose(7,2)*(.3^2)*(.7^5) #calculate by hand

#sample mean
mean(X) 
7*.3
#sample variance
var(X)
7*.3*(1-.3)
#sample standard deviation
sd(X)
sqrt(7*.3*(1-.3))

#Sample of 10
X_10=rbinom(10,7, .3)
#sample mean
mean(X_10)
7*.3
#sample variance
var(X_10)
7*.3*(1-.3)
#sample standard deviation
sd(X_10)
sqrt(7*.3*(1-.3))

#Generate N=15 independent normal random variables with mean=20 and sd=8 
N_15=rnorm(15, mean=20,sd=8 ) 
N_15

#What is the mean of our sample?
mean(N_15) #Is this close to E(x)=20?


#What is the variance of our sample? The standard deviation?
var(N_15) 
sd(N_15) 

#What is the skewness and kurtosis of our sample?
skewness(N_15) #skewness of normal distribution is 0!
#negative indicates skewed left, positive indicates skewed right
kurtosis(N_15) #kurtosis of normal distribution should be near 3

#plot a histogram of the distribution of our sample
h<-hist(N_15, breaks=5, col="blue", xlab="Simulation", 
  	main="Histogram with Normal Curve") 
xfit<-seq(min(N_15),max(N_15),length=15) 
yfit<-dnorm(xfit,mean=20,sd=8) 
yfit <- yfit*diff(h$mids[1:2])*length(N_15) 
lines(xfit, yfit, col="green", lwd=2) #normal curve



#Now generate N=10000 independent normal random variables with mean=20 and sd=8
N_big=rnorm(10000, mean=20, sd=8)


#What is the mean of our sample?
mean(N_big) #Is this close to E(x)=20?

### THis is called the law of large numbers!  
#The average of the results obtained from a large number of 
#trials should be close to the expected value

#What is the variance of our sample?
var(N_big)
sd(N_big) 

#What is the skewness and kurtosis of our sample?
skewness(N_big) #skewness of normal distribution is 0!
#negative indicates skewed left, positive indicates skewed right
kurtosis(N_big) #kurtosis of normal distribution is near 3

#plot a histogram of the distribution of our sample
h_big<-hist(N_big, breaks=50, col="blue", xlab="Simulation", 
  	main="Histogram with Normal Curve") 
#xfit<-seq(min(N_big),max(N_big),length=10000) 
#yfit<-dnorm(xfit,mean=20,sd=8) 
#yfit <- yfit*diff(h$mids[1:2])*length(N_big) 
#lines(xfit, yfit, col="green", lwd=2) #normal curve

x=seq(2.5,4.5,0.001)

plot(x,dnorm(x,mean=3.5,sd=0.34),type='l',main='The distribution of the sample mean using CLT')

barX=rep(0,1000)
for (i in 1:1000){barX[i]=mean(sample(1:6,30,replace=T))}
mean(barX)
var(barX)

hist(barX,freq=NULL, col="Green")
par(new=TRUE)
plot(x,dnorm(x,mean=3.5,sd=0.34),type='l', xaxt="n", yaxt="n", xlab="", ylab="", col="purple")

###set your working directory##
#setwd("/Users/sarahmullin/Desktop/BMI 504/")
###make sure datafiles are in the folder that you set your working directory to.
######hospital infection risk data

