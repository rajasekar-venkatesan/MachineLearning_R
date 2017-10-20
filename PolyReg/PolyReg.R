#PolyReg
dataset = read.csv('Position_Salaries.csv')

dataset = dataset[,2:3]

#Fitting LinReg and PolyReg
lin_reg = lm(formula = Salary~., 
             data = dataset)

# dataset$Level2 = dataset$Level^2
# dataset$Level3 = dataset$Level^3
# dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary~.,
              data = dataset)

#Visualizing LinReg and PolyReg
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (LinReg)') + 
  xlab('Level') +
  ylab('Salary')

ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (PolyReg)') + 
  xlab('Level') +
  ylab('Salary')

x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(poly_reg, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (PolyReg)') + 
  xlab('Level') +
  ylab('Salary')

#Prediction on LinReg and PolyReg
y_pred = predict(lin_reg, newdata = data.frame(Level = 6.5))
y_pred = predict(poly_reg, newdata = data.frame(Level = 6.5,
                                                Level2 = 6.5^2,
                                                Level3 = 6.5^3,
                                                Level4 = 6.5^4))
