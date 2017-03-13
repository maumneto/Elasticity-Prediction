# ------------------------------------------------------------------ #
# --- Linear Regression method for elasticity data in the cloud ---- #
#   @Code made by Mauricio M. Neto -- @maumneto@gmail.com            #
# ------------------------------------------------------------------ #

## preparing the workspace for new simulations
rm(list=ls(all=TRUE));

library(ggplot2)
## Call some needed in forecasting analyses
source("C:\\Users\\MaurícioM\\Google Drive\\Códigos\\Rstudio - Prediction for Elasticity Data_\\ErrorFunction.R")
source("C:\\Users\\MaurícioM\\Google Drive\\Códigos\\Rstudio - Prediction for Elasticity Data_\\ElasticityData.R")

# capture the inicial clock of each method
CPUtimeETS <- proc.time();

## Call the function "ElasticityData" that carry this data:
# 1 - return the time of measurement; 2 - return CPU user data; 3 - return CPU system data; 
# 4 - return CPU idle data; 5 - return memory total data; 6 - return memory used data; 7- return memory free data;
# 8 - return throughput Kb read data; 9 - return throughput Kb write data; 10 - return throughput Kb input data;
# 11 - return throughput Kb output data;

valueData <- ElasticityData(3);               # Loads elasticity data
timeHorizon <- 1:438;

dados <- data.frame(timeHorizon,valueData);
dados


modelolm <- lm(valueData~timeHorizon, dados);

anova(modelolm)

ggplot(data=dados,aes(y=valueData,x=timeHorizon))+geom_line(col = "black")+geom_smooth(method="lm")+

#par(mfrow = c(2,2))
#plot(modelolm)