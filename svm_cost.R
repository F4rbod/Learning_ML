install.packages("e1071")
library(e1071)

regressor1=svm(formula=Profit~R.D.Spend,data=training_set,type="eps-regression",gamma=1,cost=0.01)
regressor2=svm(formula=Profit~R.D.Spend,data=training_set,type="eps-regression",gamma=1,cost=0.1)
regressor3=svm(formula=Profit~R.D.Spend,data=training_set,type="eps-regression",gamma=1,cost=1)
regressor4=svm(formula=Profit~R.D.Spend,data=training_set,type="eps-regression",gamma=1,cost=10)
regressor5=svm(formula=Profit~R.D.Spend,data=training_set,type="eps-regression",gamma=1,cost=100)

plot_svr=ggplot(data=training_set)
plot_svr+geom_point(aes(x=R.D.Spend,y=Profit),color="Red",size=0.1)+
  geom_line(aes(x=R.D.Spend,y=predict(regressor1,R.D.Spend=training_set$R.D.Spend)),color="Purple")+
  geom_line(aes(x=R.D.Spend,y=predict(regressor2,R.D.Spend=training_set$R.D.Spend)),color="Blue")+
  geom_line(aes(x=R.D.Spend,y=predict(regressor3,R.D.Spend=training_set$R.D.Spend)),color="Yellow")+
  geom_line(aes(x=R.D.Spend,y=predict(regressor4,R.D.Spend=training_set$R.D.Spend)),color="Red")+
  geom_line(aes(x=R.D.Spend,y=predict(regressor5,R.D.Spend=training_set$R.D.Spend)),color="Black")

