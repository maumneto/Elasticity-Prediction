# ------------------------------------------------------------------ #
# -------- ETS method for elasticity data in the cloud ------------- #
#   @Code made by Mauricio M. Neto -- @maumneto@gmail.com            #
# ------------------------------------------------------------------ #

## preparing the workspace for new simulations
rm(list=ls(all=TRUE));

## Libraries necessary to call the forecasting methods
library(forecast)   # for forecast methos


## Call some needed in forecasting analyses
source("path_to_ErrorFunction.R")
source("path_to_ElasticityData.R")

# capture the inicial clock of each method
CPUtimeETS <- proc.time()

## Call the function "ElasticityData" that carry this data:
# 1 - return the time of measurement; 2 - return CPU user data; 3 - return CPU system data; 
# 4 - return CPU idle data; 5 - return memory total data; 6 - return memory used data; 7- return memory free data;
# 8 - return throughput Kb read data; 9 - return throughput Kb write data; 10 - return throughput Kb input data;
# 11 - return throughput Kb output data;

timeHorizon <- ElasticityData(1);             # Time horizon (for some methods)
valueData <- ElasticityData(2);               # Loads elasticity data

# ExponenTial Smoothing - ETS (Error, Trend, Seasonal)

fitETS <- ets(valueData[1:400], model = "ZZZ", damped = FALSE); # ZZZ = Auto-ETS
fcastETS <- forecast(fitETS,h = 38);
plot(fcastETS)
clockTimeETS <- summary(proc.time() - CPUtimeETS);    
clockTimeETS    # Time of system

# Error values
error <- valueData[401:438] - fcastETS$mean;    
RMSEerror(error);
MAPEerror(valueData[401:438], fcastETS$mean);
MAEerror(error);
