
rm(list=ls())
Post.csv<-read.table("D:/Blythe/R/Post.csv", header = TRUE, sep = ",", quote = "\"", dec = ".", fill = TRUE, comment.char = "")
Month1.csv<-read.table("D:/Blythe/R/Month-1.csv", header = TRUE, sep = ",", quote = "\"", dec = ".", fill = TRUE, comment.char = "")
Month6.csv<-read.table("D:/Blythe/R/Month-6.csv", header = TRUE, sep = ",", quote = "\"", dec = ".", fill = TRUE, comment.char = "")
Pre <- Post.csv$Pre
PrePost <- Post.csv$Post
PreOne <- Month1.csv$Pre
Month1 <- Month1.csv$X1MO
Pre6 <- Month6.csv$Pre
Month6 <- Month6.csv$X6MO
col2rgb(c("blue", "orange", "red","red50"))
c1 = rgb(0,0,255,max = 255, alpha = 80, names = "blue")
c2 = rgb(255,165,0, max = 255, alpha = 80, names = "orange")
c3 = rgb(255,0,0, max = 255, alpha = 80, names = "red")
c4 = rgb(139,0,0, max = 255, alpha = 80, names = "darkred")
range(c(Pre,PrePost))
pretty(20:100, n=12)
# POST Histogram vectors
hgPre <- hist(Pre,
     breaks = pretty(20:100,n=12), plot=FALSE)
hgPrePost <- hist(PrePost,breaks = pretty(20:100, n=12), plot=FALSE)


# The hard way: Via R's code
png(filename="D:/Blythe/R/Post.png", # Open device
    width=388,
    height=371)#pixel dimensions for png
par(oma=c(1,1,1,1))# Sets outside margins: b, 1, t, r
par(mar=c(4,4,1,0.5)) # Sets plot margins
plot(hgPre, freq= FALSE, col=c1, xlab = "Pre & Post PAM Score 1-100", main = "" )
plot(hgPrePost, freq=FALSE, col=c2, add=TRUE)

# POST Plot 2: normal curve
curve(dnorm(x,mean=mean(Pre), sd=sd(Pre)), col="blue", lwd=2, add=TRUE)
curve(dnorm(x,mean=mean(PrePost), sd=sd(PrePost)), col="darkorange", lwd=2, add=TRUE)

dev.off() # Close device (run in same block)



