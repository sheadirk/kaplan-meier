# Library ----
library(survival)
library(broom)
library(drc)

# Data read ----
salmon <- read.csv("data/KMPlot.csv")

head(salmon, 3)

kmc <- survfit(Surv(time, outcome) ~ Dose, data = salmon)

# Results ----
kmc
print(tidy(kmc))

# LT50 ----
#model <- drm(outcome ~ time, fct = LL.3(), data = salmon)

#lt50 <- ED(model, 50, interval = "delta")

#print(lt50)

lt.50 <- quantile(kmc, probs = .5)

lt.50
# Plot ----
#plot(model, type = "all")


# KMC Plot ----
kmc_plot <- plot(kmc, ylab = "Survival Probability", xlab = "Time", 
                    col = c("red", "blue"))
                
kmc_plot

