library(readr)
##install.packages("VGAM")
library(VGAM)
EF <- read_csv("EF Research/EF Egypt Data - Sheet1 (1).csv")
attach(EF) 
summary(EF)

##### Make variables for pPA and pInv
propinv <- Invalid/Total ##proportion of invalid votes
propinv

propSisi <- Sisi/Valid
propSisi

###Regresion testing
depVar <- cbind(Invalid, Valid)
depVar
m1 <- vglm(depVar ~ propSisi, family=betabinomial)
summary(m1)

###plots
plot(propSisi, propinv)

##### My additions

##### Model data without the Outside

# undo the attaching of the data
detach(EF)

# eliminate the record with the Outsides
EF2 = EF[-9, ]
summary(EF2)

attach(EF2)


### Make variables for pPA and pInv
propinv <- Invalid/Total ##proportion of invalid votes
propSisi <- Sisi/Valid


### Regresion testing
depVar <- cbind(Invalid, Valid)

m2 <- vglm(depVar ~ propSisi, family=betabinomial)
summary(m2)



### The Graph?