#DTReg
dataset = read.csv('Position_Salaries.csv')

dataset = dataset[,2:3]

#install.packages('rpart')
library(rpart)
#Fitting 
regressor = rpart(formula = Salary~., data = dataset, control = rpart.control(minsplit = 1))
#Prediction on LinReg and PolyReg
y_pred = predict(regressor,data.frame(Level = 6.5))
#Visualizing LinReg and PolyReg
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (SVR)') + 
  xlab('Level') +
  ylab('Salary')

x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (PolyReg)') + 
  xlab('Level') +
  ylab('Salary')

