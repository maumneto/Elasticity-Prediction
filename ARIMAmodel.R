# ------------------------------------------------------------------ #
# ------------- ARIMA for elasticity data in the cloud ------------- #
#   @Code made by Mauricio M. Neto -- @maumneto@gmail.com            #
# ------------------------------------------------------------------ #

## preparing the workspace for new simulations
rm(list=ls(all=TRUE));

library(forecast)   # for forecast methods
library(zoo)        

## Call some needed in forecasting analyses
source("C:\\Users\\MaurícioM\\Google Drive\\Códigos\\Rstudio - Prediction for Elasticity Data_\\ErrorFunction.R")
source("C:\\Users\\MaurícioM\\Google Drive\\Códigos\\Rstudio - Prediction for Elasticity Data_\\ElasticityData.R")

# capture the inicial clock of each method
CPUtimeARIMA <- proc.time()

## Call the function "ElasticityData" that carry this data:
# 1 - return the time of measurement; 2 - return CPU user data; 3 - return CPU system data; 
# 4 - return CPU idle data; 5 - return memory total data; 6 - return memory used data; 7- return memory free data;
# 8 - return throughput Kb read data; 9 - return throughput Kb write data; 10 - return throughput Kb input data;
# 11 - return throughput Kb output data;

timeHorizon <- ElasticityData(1);             # Time horizon (for some methods)
valueData <- ElasticityData(4);               # Loads elasticity data

# AutoRegressive Integrated Moving Average (auto-ARIMA) - better to short windows

arimafit <-  auto.arima(valueData[1:400]);    # "arimafit" receive the auto-arima model of the data
fcast <- forecast(arimafit, h = 38);          # Forecast fuction receive the model and prediction window 
plot(fcast);                                  # Plot the graph     
clockTimeArima <- summary(proc.time() - CPUtimeARIMA);    
clockTimeArima    # Time of system

# Error values
error <- valueData[401:438] - fcast$mean;    
RMSEerror(error);
MAPEerror(valueData[401:438], fcast$mean);
MAEerror(error);
