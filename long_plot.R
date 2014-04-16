long <- read.csv("series_long.csv")
alexeySeries <- subset(long, author == "AlexeyR", c("score", "view", "fav"))
CleverMouse  <- subset(long, author == "CleverMouse", c("score", "view", "fav"))
Moozund      <- subset(long, author == "Moozund", c("score", "view", "fav"))

draw_series <- function(ylim,y,y1,y2){
  x = 1:length(y)
  plot(x,y, col="blue", ylab=NA, xlab="Номер в серии", xaxt='n', ylim=c(0,ylim), las=1)
  axis(1,at=1:17)

  lo = loess(y~x)
  lines(predict(lo), col='blue', lwd=1)

  x1 = 1:length(y1)
  points(x1,y1, col="red")

  lo = loess(y1~x1)
  lines(predict(lo), col='red', lwd=1)

  x2 = 1:length(y2)
  points(x2,y2, col="green")

  lo = loess(y2~x2)
  lines(predict(lo), col='green', lwd=1)

}
#draw_series(100000,alexeySeries$view, CleverMouse$view, Moozund$view)
#title(ylab="Просмотры", main="Зависимость количества просмотров от номера серии")
#legend("topright", c("AlexeyR", "CleverMouse", "Moozund"), title="Авторы серий", fill=c("blue","red","green"))
#draw_series(1000,alexeySeries$fav,CleverMouse$fav, Moozund$fav)
#title(ylab="Избранное", main="Зависимость количества записей в избранное от номера серии")
#legend("topright", c("AlexeyR", "CleverMouse", "Moozund"), title="Авторы серий", fill=c("blue","red","green"))
draw_series(170,alexeySeries$score ,CleverMouse$score, Moozund$score)
title(ylab="Рейтинг", main="Зависимость рейтинга от номера серии")           
legend("topright", c("AlexeyR", "CleverMouse", "Moozund"), title="Авторы серий", fill=c("blue","red","green"))
