library(caTools)

X50_Startups$State=factor(x=X50_Startups$State,levels = c("New York","California","Florida"),labels = c(1,2,3))

set.seed(123)
split=sample.split(X50_Startups$Profit,SplitRatio = 0.8)
training_set=subset(X50_Startups,split==T)
test_set=subset(X50_Startups,split==F)

colnames(X50_Startups)=make.names(colnames(X50_Startups))

regressor=lm(Profit~.,data=training_set)
summary(regressor)
slm=step(regressor,direction = "both")
summary(slm)

plot_training=ggplot(data = training_set)
plot_testing=ggplot(data=test_set)
plot_training+geom_point(aes(y=Profit,x=YearsExperience),color="red")+geom_line(aes(x=YearsExperience,y=predict(regressor,training_set)))
plot_testing+geom_point(aes(y=Salary,x=YearsExperience),color="red")+geom_line(aes(x=YearsExperience,y=predict(regressor,test_set)))

