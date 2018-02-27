library(ggplot2)
library(gridExtra)
library(dplyr)
post.invastion <- read.csv("Post-Invasion.2.5Or_500.csv")
post.invastion <- post.invastion[2:ncol(post.invastion)]

post.invastion$Wae_Production <-
  rowSums(post.invastion[, c(4, 5, 7, 8)])

post.invastion$Yep_Production <-
  rowSums (post.invastion[, c(9:15, 17, 18)])

post.invastion$Sun_Production1 <-
  rowSums (post.invastion[, c(19:26, 28)])

post.invastion$Trt_Production <- rowSums(post.invastion[, c(30, 31)])

post.invastion$Lwf_Production <-
  rowSums (post.invastion[, c(32, 34, 35)])

post.invastion$Sun_Production2 <-
  rowSums (post.invastion[, c(56:62, 64)])

data <- post.invastion %>%
  select(Wae_Production,Yep_Production,Sun_Production1,Trt_Production,Lwf_Production,Sun_Production2)%>%
  melt()%>%
  ggplot(aes(x=value))+geom_density()+facet_wrap(~variable,scales = "free")+theme_bw()