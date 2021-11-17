library(dplyr)
library(plyr)

setwd('/Users/sarahmullin/Desktop/Teaching/BioStatsBasics/')
Example_1=read.csv("Dataset1.csv", sep=",", header=T)
colnames(Example_1)<-c("Cholesterol", "Group")

#n1=133
n1=length(Example_1[Example_1[,2]==1,][,2])
n1
#n2=41
n2=length(Example_1[Example_1[,2]==2,][,2])
n2

par(mfrow=c(2,2))
hist(Example_1[Example_1[,2]==1,][,1], main="Histogram of Cholesterol for PH patients", xlab="Cholesterol")
hist(Example_1[Example_1[,2]==2,][,1], main="Histogram of Cholesterol for NT patients", xlab="Cholesterol")
qqnorm(Example_1[Example_1[,2]==1,][,1])
qqnorm(Example_1[Example_1[,2]==2,][,1])

par(mfrow=c(1,1))
boxplot(Example_1$Cholesterol~Example_1$Group)
sqrt(var(Example_1[Example_1[,2]==1,][,1]))
sqrt(var(Example_1[Example_1[,2]==2,][,1]))

T1=t.test(Example_1$Cholesterol~Example_1$Group, alternative="greater", var.equal=T)
T1
T2=t.test(Example_1$Cholesterol~Example_1$Group, alternative="greater", var.equal=F)
T2

?t.test

t.test(Example_1$Cholesterol~Example_1$Group, alternative="less", var.equal=T)
##note: 
1-T1$p.value

t.test(Example_1$Cholesterol~Example_1$Group, alternative="two.sided", var.equal=T)
2*T1$p.value
#Note: Since this is a two-sided test, the 95% confidence interval is bounded by two sides--(10.77, 32.26)

##create 2x2 table
Example_2<-as.table(matrix(c(20,30,10,40), nrow=2, ncol=2, dimnames=list(c("Growth:Yes", "Growth:No"), c("Centrifuged", "Noncentrifuged" ))))
###tables can also be created from individual data using the function table()
Example_2

##H0: no association between growth and centrifugation in the population; p1-p2=0
##Ha: association between growth and centrifugation the population p1-p2=0

#incidence of combined morbidity index
n1=Example_2[1,2]+Example_2[1,1]
n2=Example_2[2,1]+Example_2[2,2]
incidence_exposed=Example_2[1,1]/n1  ####p1
incidence_unexposed=Example_2[2,1]/n2  ####p2
incidence_exposed
incidence_unexposed


###Chi-square test
Test_2=chisq.test(Example_2, correct=F)
Test_2
#often times, we use something called continuity correction when we are using a continuous function (like the Chi-square) to approximate a discrete function (like binomial)
# to enable continuity correction, change Test=chisq.test(Ex1, correct=T)

####check assumptions, expected count at least 80% of cells >5: 
Test_2$expected
#all cells are greater than 5

#df=(r-1)*(c-1)=(2-1)*(2-1)=1
#Test statistic=4.7619
#p-value is P(X^2>7.101)=.0291
#this p-value can also be found this way: 1-pchisq(4.7619,1)


##create 2x2 table
Example_3<-as.table(matrix(c(2,0,115,862), nrow=2, ncol=2, dimnames=list(c("Group1:exposed", "Group2:unexposed "), c("Colonic Necrosis", "No Colonic Necrosis" ))))
Example_3

###incidence estimates
n1=Example_3[1,2]+Example_3[1,1]
n2=Example_3[2,1]+Example_3[2,2]
incidence_exposed=Example_3[1,1]/n1  ####p1
incidence_unexposed=Example_3[2,1]/n2  ####p2
incidence_exposed
incidence_unexposed

##H0: no association between drug and colonic necrosis in the population; p1-p2=0
##Ha: association between drug and colonic necrosisin the population p1-p2 >0


####check assumptions, expected count at least 80% of cells >5: 
Test_3=chisq.test(Example_3)
Test_3$expected


###two cells <5...use fisher exact
Test_3=fisher.test(Example_3, alternative="greater")
Test_3

?fisher.test

###create 2x2 table
Example_4<-as.table(matrix(c(0,5,17,0), nrow=2, ncol=2, dimnames=list(c("Yes Died Smoking Twin", "No Died Smoking Twin "), c("Yes Died Non-Smoking Twin", "No Died Non-Smoking Twin" ))))
###tables can also be created from individual data using the function table()
###Normal Approximation Method: McNemar 
##H0: no association between smoking and earlier mortality in the population; 
##marginal probabilities for each outcome are the same p_a+p_b=p_c+p_d
##Ha: association between smoking and earlier mortality in the population
Example_4

#Check assumption b+c>20: 5+17>20 
##without continuity correction
mcnemar.test(Example_4, correct=F)
#with continuity correction
mcnemar.test(Example_4, correct=T)

#Test statistic: X^2=5.5
#df=1
#p-value=.01902
#same as
1-pchisq(5.5,1)
#1-P(X^2<5.5)=P(X^2>5.5)

##H0: no association between smoking and earlier mortality in the population; 
#marginal probabilities for each outcome are the same p_a+p_b=p_c+p_d
##Ha: association between smoking and earlier mortality in the population

#number of discordant pairs n=17+5 Bernouilli Trials
n=Example_4[1,2]+Example_4[2,1]
n
###proportion of positive discordancies
p=Example_4[1,2]/n
p
###number of successes
x=Example_4[1,2]
x

###binomial test
binom.test(x,n, alternative=c("two.sided"))

Occasion<-c(seq(1,10,1),seq(1,10,1))

Cloth<-c(1*10^4,3.3*10^7,5.7*10^7,1.9*10^7,1.2*10^4,8.8*10^2,2.6*10^6,3.3*10^7,8.7*10^6,7.6*10^7 )
Sponge<-c(4.6*10^6,9.8*10^7,1.3*10^8,1.3*10^8,6.0*10^2,4.7*10^7,1.4*10^8,1.2*10^8,2.1*10^8,1.1*10^8 )
Df2<-cbind(Occasion, Cloth, Sponge)
colnames(Df2)<-c("Occasion", "Cloth", "Sponge")
Df2

wilcox.test(Cloth,Sponge, data=Df2,paired=TRUE)

Example_5<-as.table(matrix(c(10,20,15,15,15,10,10,5), nrow=2, ncol=4, dimnames=list(c("Yes", "No"), c("1 = no growth", "2 = minimal growth","3 = moderate growth","4 = confluent growth" ))))
Example_5


# Let's turn this into a dataset!
Growth<-c(rep(1,10), rep(2,15), rep(3,15), rep(4,10),rep(1,20), rep(2,15), rep(3,10), rep(4,5))
CultureGroups<-c(rep('Yes',50), rep('No',50))
Df<-as.data.frame(cbind(as.numeric(Growth),CultureGroups))
colnames(Df)<-c('Growth', 'CultureGroups')

library(lattice)

histogram(~ factor(Growth, ordered=T) | CultureGroups,
          data=Df,
          layout=c(1,2)      #  columns and rows of individual plots
          )

wilcox.test(as.numeric(Growth)~CultureGroups, data=Df)
