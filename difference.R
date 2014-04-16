data1 <- read.csv("series1.csv")
data2 <- read.csv("series2.csv")

draw_dif <- function(x,y1,y2, ylim=NA, ylab=NA, main=NA){

  stopifnot(length(y1) == length(y2))

  data = data.frame(x = x, y1 = y1, y2 = y2) 
  data = data[order(data$y1),]
  
  y1 = data$y1
  y2 = data$y2

  #prot points and lasso line for the first parts
  if(is.na(ylim)){
   plot(y1, col="blue")
  }
  else{
   plot(y1, col="blue", ylim=c(0,ylim), ylab=ylab, main=main, lab.cex=1.2, xlab="Индекс статьи", las=1)
  }

  #for the second parts
  dummyx = 1:length(y2)
  points(dummyx,y2, col="red")


  #compute distance and draw lines between first and second parts
  for(i in 1:length(y1)){
   dif = y1[i] - y2[i]
   if(dif > 0){
    col = "blue"
   }
   else{
    col = "red"
   }
     segments(i, y1[i], y1 = y2[i], col=col) 
  }
}

print_percent_dif <- function(y1,y2){
  dif     = y1 - y2
  sum_dif = sum(dif < 0)
  print(sum_dif/length(y1))
}

par(mfrow=c(3,1))
draw_dif(data1$id,data1$score,data2$score, ylim=270, ylab="Рейтинг", main="Разница в рейтинге между первой и второй частью.\n Синяя точка — первая часть, красная точка — вторая часть.\n Если разница между первой и второй частью положительнa отрезок синего цвета, иначе красного." )
draw_dif(data1$id, data1$view,data2$view, ylim=200000, ylab="Просмотры", main="Разница в просмотрах между первой и второй частью.\n Синяя точка — первая часть, красная точка — вторая часть.\n Если разница между первой и второй частью положительнa отрезок синего цвета, иначе красного.")
 draw_dif(data1$id, data1$fav, data2$fav,ylim=1500, ylab="Избранное", main="Разница в избранном между первой и второй частью.\n Синяя точка — первая часть, красная точка — вторая часть.\n Если разница между первой и второй частью положительнa отрезок синего цвета, иначе красного.")

 print_percent_dif(data1$score, data2$score)
 print_percent_dif(data1$view, data2$view)
 print_percent_dif(data1$fav, data2$fav)
