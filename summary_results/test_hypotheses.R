
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



computeW <- function(vDefault, vBest){
clift = cliff.delta(d = vDefault, f =  vBest)
print("-->Cliff delta")
print(clift)
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

print("------RQ1-----JDT")
vDefault = as.numeric(readLines("/Users/matias/develop/gt-tuning/git-dat-results/summary_results/RQ1/JDT/values_default.txt"))
vBest = as.numeric(readLines("/Users/matias/develop/gt-tuning/git-dat-results/summary_results/RQ1/JDT/values_best.txt"))

computeW(vDefault, vBest)

print("------RQ1-----SPOON")

vDefault = as.numeric(readLines("./RQ1/Spoon/values_default.txt"))
vBest = as.numeric(readLines("./RQ1/Spoon/values_best.txt"))
computeW(vDefault, vBest)



######################

print("------RQ3-----Spoon Default vs local")

#v1 = as.numeric(readLines("/Users/matias/develop/gt-tuning/git-code-gpgt/out/last1651272078096/ExaJDT_5000__values_ClassicGumtree-bu_minsim-0.5-bu_minsize-1000-st_minprio-1-st_priocalc-height.txt"))#[limitd:limitup]
#v2 = as.numeric(readLines("/Users/matias/develop/gt-tuning/git-code-gpgt/out/last1651272078096/ExaJDT_5000__values_local.txt"))#[limitd:limitup]


vDefault = as.numeric(readLines("./RQ3/Spoon/values_ClassicGumtree-bu_minsim-0.5-bu_minsize-1000-st_minprio-1-st_priocalc-height.txt"))
vBest = as.numeric(readLines("./RQ3/Spoon/values_local.txt"))
computeW(vDefault, vBest)



print("------RQ3-----JDT Default vs local")

vDefault = as.numeric(readLines("./RQ3/JDT/values_ClassicGumtree-bu_minsim-0.5-bu_minsize-1000-st_minprio-1-st_priocalc-height.txt"))
vBest = as.numeric(readLines("./RQ3/JDT/values_local.txt"))
computeW(vDefault, vBest)

#####


print("------RQ3-----JDT Best Global vs Best local")


vBestGlobal = as.numeric(readLines("./RQ3/JDT/values_HybridGumtree-bu_minsize-200-st_minprio-1-st_priocalc-size.txt"))
vBestLocal = as.numeric(readLines("./RQ3/JDT/values_local.txt"))
computeW(vBestGlobal, vBestLocal)



print("------RQ3-----Spoon Best Local vs local")

vBestGlobal = as.numeric(readLines("./RQ3/Spoon/values_ClassicGumtree-bu_minsim-0.2-bu_minsize-600-st_minprio-1-st_priocalc-size.txt"))
vBestLocal = as.numeric(readLines("./RQ3/Spoon/values_local.txt"))
computeW(vBestGlobal, vBestLocal)
