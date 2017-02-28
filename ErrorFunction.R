# ------------------------------------------------------- #
# -----  Error fuctions for forecasting methods --------- #
# @Code made by Mauricio M. Neto -- @maumneto@gmail.com   # 
# ------------------------------------------------------- #

# Mean Absolute Error - MAE
MAEerror <- function(error)
{
  MAEerror <- mean(abs(error));
  return(MAEerror);
}

# Mean Absolute Percentage Error - MAPE
MAPEerror <- function(serie, predictSerie) 
{
  MAPEerror <- mean(abs((serie - predictSerie)/serie));
  MAPEerror <- MAPEerror*100;
  return(MAPEerror)
}

# Root Mean Squared Error - RMSE
RMSEerror <- function(error)
{
  RMSEerror <- sqrt(mean(error^2));
  return(RMSEerror)
}

# Serie variance 
Variance <- function(predictSerie) 
{
  Variance <- var(predictSerie);
  return(Variance)
}

# Standard deviation of the serie
StandDesv <- function(predictSerie) 
{
  StandDesv <- sd(predictSerie);
  return(StandDesv)  
}

#Mean Squared Error - MSE
MSEerror <- function(serie, predictSerie)
{
  MSEerror <- mean((predictSerie - serie)^2);
  return(MSEerror)
}

