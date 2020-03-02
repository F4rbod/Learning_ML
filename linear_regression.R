library(caTools)
set.seed(123)
split=sample.split(Salary_Data$Salary,SplitRatio = 2/3)
training_set=subset(Salary_Data,split==T)
test_set=subset(Salary_Data,split==F)

regressor=lm(Salary~YearsExperience,data = training_set)
summary(regressor)

y_pred=predict(regressor,test_set)
library(ggplot2)

diffs=cbind(test_set,y_pred,test_set$Salary-y_pred)

plot_training=ggplot(data = training_set)
plot_testing=ggplot(data=test_set)
plot_training+geom_point(aes(y=Salary,x=YearsExperience),color="red")+geom_line(aes(x=YearsExperience,y=predict(regressor,training_set)))
plot_testing+geom_point(aes(y=Salary,x=YearsExperience),color="red")+geom_line(aes(x=YearsExperience,y=predict(regressor,test_set)))

