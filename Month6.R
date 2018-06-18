rm(list=ls())
Month6.csv<-read.csv("D:/Blythe/R/Month-6.csv")

Pre6 <- Month6.csv$Pre
Month6 <- Month6.csv$X6MO

c1 = rgb(0,0,255,max = 255, alpha = 80, names = "blue")
c2 = rgb(255,165,0, max = 255, alpha = 80, names = "orange")
c3 = rgb(255,0,0, max = 255, alpha = 80, names = "red")
c4 = rgb(139,0,0, max = 255, alpha = 80, names = "darkred")

# Plot 1: Histogram
hgPre6 <- hist(Pre6,
               breaks = pretty(20:100,n=12), plot=FALSE)
hgMonth6 <- hist(Month6,breaks = pretty(20:100, n=12), plot=FALSE)

# The hard way: Via R's code
png(filename="D:/Blythe/R/Month6.png", # Open device
    width=388,
    height=371)#pixel dimensions for png
par(oma=c(1,1,1,1))# Sets outside margins: b, 1, t, r
par(mar=c(4,4,1,0.5)) # Sets plot margins

plot(hgPre6, freq= FALSE, col=c1, xlab = "Pre & Month 6 PAM Score 1-100", main = "" )
plot(hgMonth6, freq=FALSE, col=c4, add=TRUE)


# Plot 2: normal curve
curve(dnorm(x,mean=mean(Pre6, na.rm=TRUE), sd=sd(Pre6, na.rm=TRUE)), col="darkblue", lwd=2, add=TRUE)
curve(dnorm(x,mean=mean(Month6, na.rm=TRUE), sd=sd(Month6, na.rm=TRUE)), col="darkred", lwd=2, add=TRUE)

dev.off() # Close device (run in same block)
