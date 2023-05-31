
install.packages('magrittr')
install.packages('tidyverse')
install.packages('rstatix')
install.packages('ggpubr')
install.packages('datarium')
if(!require(lsr)){install.packages("lsr")}
library(tidyverse)
library(rstatix)
library(ggpubr)
library(effsize)
library(rcompanion)
library(lattice)
library(FSA)
library(lsr)  

print("RQ1-----JDT")
vDefault = as.numeric(readLines("./RQ1/median/JDT/ExaJDT_1000__values_ClassicGumtree-bu_minsim-0.5-bu_minsize-1000-st_minprio-1-st_priocalc-height.txt"))
vBest = as.numeric(readLines("./RQ1/median/JDT/ExaJDT_1000__values_best.txt"))

clift = cliff.delta(d = vDefault, f =  vBest)
print(clift)
wTest <- wilcox.test(vDefault,vBest, paired = TRUE , alternative =  "greater")
print(wTest)
##  Rosenthal's R 
m = data.frame(vDefault, vBest)
wR <- wilcoxonR(x=m$vDefault, g=m$vBest)
print(wR)

print("RQ1-----SPOON")
vDefault = as.numeric(readLines("./RQ1/median/Spoon/ExaSpoon_1000__values_ClassicGumtree-bu_minsim-0.5-bu_minsize-1000-st_minprio-1-st_priocalc-height.txt"))
vBest = as.numeric(readLines("./RQ1/median/Spoon/ExaSpoon_1000__values_best.txt"))

clift = cliff.delta(d = vDefault, f =  vBest)
print(clift)
wTest <- wilcox.test(vDefault,vBest, paired = TRUE , alternative =  "greater")
print(wTest)
##  Rosenthal's R 
m = data.frame(vDefault, vBest)
wR <- wilcoxonR(x=m$vDefault, g=m$vBest)
print(wR)
#wilcox_effsize(vDefault ~ vBest, data = m, paired = TRUE)



