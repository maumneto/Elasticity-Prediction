# ------------------------------------------------------------------ #
# -------- Predictive methods for elasticity in the cloud ---------- #
#   @Code made by Mauricio M. Neto -- @maumneto@gmail.com            #
# ------------------------------------------------------------------ #

## preparing the workspace for new simulations
rm(list=ls(all=TRUE));

## Libraries necessary to call the forecasting methods
library(e1071)      # for svm
library(tseries)    #
library(forecast)   # for forecast methos
library(zoo)        #
library(nnet)       # for neural network

## Call some needed in forecasting analyses
source("path_to_ErrorFunction.R")
source("path_to_ElasticityData.R")

# capture the inicial clock of each method
CPUtimeARIMA <- proc.time()

## Call the function "ElasticityData" that carry this data:
# 1 - return the time of measurement; 2 - return CPU user data; 3 - return CPU system data; 
# 4 - return CPU idle data; 5 - return memory total data; 6 - return memory used data; 7- return memory free data;
# 8 - return throughput Kb read data; 9 - return throughput Kb write data; 10 - return throughput Kb input data;
# 11 - return throughput Kb output data;

timeHorizon <- ElasticityData(1);             # Time horizon (for some methods)
valueData <- ElasticityData(2);               # Loads elasticity data

## Forecasting methods 

# 1. AutoRegressive Integrated Moving Average (auto-ARIMA) - better to short windows

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

# ---------------------------------------------------------------------------------------------------------------------

# 2. ExponenTial Smoothing - ETS (Error, Trend, Seasonal)

fitETS <- ets(valueData[1:400], model = "ZZZ", damped = FALSE); # ZZZ = Auto-ETS
fcastETS <- forecast(fitETS,h = 38);
plot(fcastETS)

# Error values
error <- valueData[401:438] - fcastETS$mean;    
RMSEerror(error);
MAPEerror(valueData[401:438], fcastETS$mean);
MAEerror(error);

# --------------------------------------------------------------------------------------------------------------------

# 3. Linear Regression

#valueDataLM <- ElasticityData(1);
#trainingData <- valueDataLM[1:400];
#testingData <- valueDataLM[400:438];
#dataAll <- cbind(trainingData,timeHorizon[1:400]);
#dataAll <- data.frame(dataAll);
#fitLM <- lm(trainingData[1:400] ~ timeHorizon[1:400], dataAll);
#predictY <- predict(fitLM, dataAll);
#plot(trainingData, predictY, col="blue", pch = 4);

# --------------------------------------------------------------------------------------------------------------------


# 4. Suport Vectors for Regression (SVR) - better to long windows (??)

#modelSVR <- svm(timeHorizon ~ valueData)
#fitSVR <- predict(modelSVR, valueData)
#points(valueData, modelSVR)

# 5. Neural Network 
#completeData <- ElasticityData(4);
#trainingData <- completeData[1:400];
#testingData <- completeData[400:438];
#fitnnet <- nnet(trainingData,,size = 4)
#summary(fitnnet)
#predNnet <- predict(fitnnet,testingData)
#fitnnet$residuals

# --------------------------------------------------------------------------------------------------------------------

