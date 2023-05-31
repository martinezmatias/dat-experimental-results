
install.packages('magrittr')
install.packages('tidyverse')
install.packages('rstatix')
install.packages('ggpubr')
install.packages('datarium')
install.packages('FSA')
install.packages('rcompanion')
install.packages('effsize')
if(!require(lsr)){install.packages("lsr")}
library(tidyverse)
library(rstatix)
library(ggpubr)
library(effsize)
library(rcompanion)
library(lattice)
library(FSA)
library(lsr)  




computeW <- function(vDefault, vBest){
#clift = cliff.delta(d = vDefault, f =  vBest)
#print("-->Cliff delta")
#print(clift)
wTest <- wilcox.test(vDefault,vBest, paired = TRUE , alternative =  "greater")
print("-->wilcox.test")
print(wTest)
##  Rosenthal's R 
m = data.frame(vDefault, vBest)
wR <- wilcoxonR(x=m$vDefault, g=m$vBest)
print("-->Rosenthal's R ")
print(wR)
#wilcox_effsize(vDefault ~ vBest, data = m, paired = TRUE)
}

print("------RQ1-----JDT- Median")
vDefault = as.numeric(readLines("/Users/matias/develop/gt-tuning/summary_results/RQ1/median/JDT/hyperopt/ExaJDT_1000__values_ClassicGumtree-bu_minsim-0.5-bu_minsize-1000-st_minprio-1-st_priocalc-height.txt"))
vBest = as.numeric(readLines("/Users/matias/develop/gt-tuning/summary_results/RQ1/median/JDT/hyperopt/ExaJDT_1000__values_best.txt"))

computeW(vDefault, vBest)


print("------RQ1-----SPOON")

vDefault = as.numeric(readLines("/Users/matias/develop/gt-tuning/summary_results/RQ1/median/Spoon/hyperopt/ExaSpoon_1000__values_ClassicGumtree-bu_minsim-0.5-bu_minsize-1000-st_minprio-1-st_priocalc-height.txt"))
vBest = as.numeric(readLines("/Users/matias/develop/gt-tuning/summary_results/RQ1/median/Spoon/hyperopt/ExaSpoon_1000__values_best.txt"))
computeW(vDefault, vBest)




