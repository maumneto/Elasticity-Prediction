# --------------------------------------------------------- #
# ----- Code to call the elasticity series data ----------- #
#   @Code made by Mauricio M. Neto -- @maumneto@gmail.com   #
# --------------------------------------------------------- #

# A brief explanation: The values of x vary from 1 - 11. Each value corresponds to a column of data values captured. 

ElasticityData <- function(x) 
{

## Setting parameters
# Load the elasticity data
serieData <- read.table("C:\\Users\\MaurícioM\\Google Drive\\Códigos\\Rstudio - Prediction for Elasticity Data_\\node-a.log", header = FALSE, sep = "|");

# return the time of measurement 
if (x == 1) 
{
  dataTime<- as.double(serieData$V1); 
  return(dataTime)  
}  

# return CPU user data
if (x == 2) 
{
  dataCPU_user <- as.double(serieData$V2); 
  return(dataCPU_user)  
}

# return CPU system data
else if (x == 3) 
{
  dataCPU_sys <- as.double(serieData$V3);
  return(dataCPU_sys)
}

# return CPU idle data
else if (x == 4) 
{
  dataCPU_idle <- as.double(serieData$V4);
  return(dataCPU_idle)
}

# return memory total data
else if (x == 5) 
{
  dataMEM_total <- as.double(serieData$V5);
  return(dataMEM_total)
}

# return memory used data
else if (x == 6) 
{
  dataMEM_used <- as.double(serieData$V6);
  return(dataMEM_used)
}

# return memory free data
else if (x == 7) 
{
  dataMEM_free <- as.double(serieData$V7);
  return(dataMEM_free)
}

# return throughput Kb read data
else if (x == 8) 
{
  dataKB_read <- as.double(serieData$V8);
  return(dataKB_read)
}

# return throughput Kb write data
else if (x == 9) 
{
  dataKB_write <- as.double(serieData$V9);
  return(dataKB_write);
}

# return throughput Kb input data
else if (x == 10) 
{
  dataKB_in <- as.double(serieData$V10);
  return(dataKB_in)
}

# return throughput Kb output data

else if (x == 11) 
{
  dataKB_out <- as.double(serieData$V11);
  return(dataKB_out)
}

}