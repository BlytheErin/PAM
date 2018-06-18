rm(list=ls())
Month1.csv<-read.table("D:/Blythe/R/Month-1.csv", header = TRUE, sep = ",", quote = "\"", dec = ".", fill = TRUE, comment.char = "")

Pre1 <- Month1.csv$Pre
Month1 <- Month1.csv$X1MO

c1 = rgb(0,0,255,max = 255, alpha = 80, names = "blue")
c2 = rgb(255,165,0, max = 255, alpha = 80, names = "orange")
c3 = rgb(255,0,0, max = 255, alpha = 80, names = "red")
c4 = rgb(139,0,0, max = 255, alpha = 80, names = "darkred")

# Plot 1: Histogram
hgPre1 <- hist(Pre1,
               breaks = pretty(20:100,n=12), plot=FALSE)
hgMonth1 <- hist(Month1,breaks = pretty(20:100, n=12), plot=FALSE)

# The hard way: Via R's code
png(filename="D:/Blythe/R/Month1.png", # Open device
    width=388,
    height=371)#pixel dimensions for png
par(oma=c(1,1,1,1))# Sets outside margins: b, 1, t, r
par(mar=c(4,4,1,0.5)) # Sets plot margins

plot(hgPre1, freq= FALSE, col=c1, xlab = "Pre & Month 1 PAM Score 1-100", main = "" )
plot(hgMonth1, freq=FALSE, col=c3, add=TRUE)


# Plot 2: normal curve
mean(Pre1, na.rm=TRUE)
curve(dnorm(x,mean=mean(Pre1, na.rm=TRUE), sd=sd(Pre1, na.rm=TRUE)), col="darkblue", lwd=2, add=TRUE)
curve(dnorm(x,mean=mean(Month1, na.rm=TRUE), sd=sd(Month1, na.rm=TRUE)), col="red", lwd=2, add=TRUE)

dev.off() # Close device (run in same block)
