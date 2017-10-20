#RFReg
dataset = read.csv('Position_Salaries.csv')

dataset = dataset[,2:3]

#install.packages('randomForest')
library(randomForest)
set.seed(1234)
#Fitting (dataset[] will give dataframe, dataset$ will give vector)
regressor = randomForest(x = dataset[1], y = dataset$Salary, ntree = 1000)
#Prediction on RFReg
y_pred = predict(regressor,data.frame(Level = 6.5))
#Visualizing RFReg
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (RFReg)') + 
  xlab('Level') +
  ylab('Salary')

x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (RFReg)') + 
  xlab('Level') +
  ylab('Salary')

