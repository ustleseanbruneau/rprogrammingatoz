
# Homework for Section 3
# https://www.superdatascience.com/pages/rcourse


# get help on rnorm() function
# ?rnorm


# Vector - only elements of same data type
MyFirstVector <- c(3, 45, 56, 732)
MyFirstVector
is.numeric(MyFirstVector)
is.integer(MyFirstVector)
is.double(MyFirstVector)

V2 <- c(3L, 12L, 243L, 0L)
is.numeric(V2)
is.integer(V2)
is.double(V2)

V3 <- c("a", "823", "Hello")
V3
is.character(V3)
is.numeric(V3)

seq() #sequence - like ':'
rep() #replicate

seq(1,15)
1:15

# sequence - 1 to 15 with step 2
seq(1,15,2)
z <- seq(1,15,4)
z

rep(3, 50)

d <- rep(3,50)
d

rep("a", 5)

# Example: replicate a vector
x <- c(80, 20)
x
y <- rep(x,10)
y


# replication each element N times
rep(5:6, each=10)
rep(5:6, times=10)

x <- c("a", "b", "c")

rep(x, each=5)
rep(x, times=5)



