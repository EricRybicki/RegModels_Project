### “Is an automatic or manual transmission better for MPG”
### "Quantify the MPG difference between automatic and manual transmissions"

mtcars <- mtcars
head(mtcars)
str(mtcars)
?mtcars

mtcars$am[mtcars$am == 0] <- "Automatic"
mtcars$am[mtcars$am == 1] <- "Manual"

library(knitr)
kable(head(mtcars))



plot(mtcars$mpg[mtcars$am == "Automatic"])
plot(mtcars$mpg[mtcars$am == "Manual"])

require(gridExtra)
bg <- ggplot(mtcars, aes(factor(am), mpg)) + geom_boxplot(colour="seagreen", size = 1.25) + geom_jitter() + theme_bw()
vg <- ggplot(mtcars, aes(factor(am), mpg)) + geom_violin(colour = "firebrick", size = 1.25) + geom_jitter() + theme_bw()

grid.arrange(bg, vg, ncol=2)

model <- lm(mpg ~ . , data = mtcars)
summary(model)
am.model <- lm(mpg ~ factor(am), data = mtcars)
summary(am.model)
hp.model <- lm(mpg ~ wt + hp + factor(am), data = mtcars)
summary(hp.model)
qsec.model <- lm(mpg ~ wt + qsec + factor(am), data = mtcars)
summary(qsec.model)

anova(am.model, qsec.model)


par(mfrow = c(2,2))
plot(model)



