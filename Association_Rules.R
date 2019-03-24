## Association Rules & Collaborative Filtering



library(arules)
library(recommenderlab)


  #  ASSOCATION RULES  #

  ## Example 1: faceplate dataset
fp.df <- read.csv("Faceplate.csv")

  ### Drop first column and convert it to a matrix
fp.mat <- as.matrix(fp.df[, -1])

  ### convert the binary incidence matrix into a transactions database
fp.trans <- as(fp.mat, "transactions")
inspect(fp.trans)

  ## Generate RUles
    ### Default support = 0.1 and confidence = 0.8
rules <- apriori(fp.trans, parameter = list(supp = 0.2, conf = 0.5, target = "rules"))

  ### Inspect the first six rules, sorted by their "Lift"
inspect(head(sort(rules, by = "lift")))

  ###  Association Rules
rules.tbl <- inspect(rules)
rules.tbl[rules.tbl$support >= 0.04 & rules.tbl$confidence >= 0.7,]



