x <- c('a', 'b', 'c', 'd')
for(i in x){
    print(i)
}
x <- 1:10
for (val in x){
    if (val == 5){
        next #used to skip/move to the next value, passing the previous condition
    }
    print(val)
}

#Functions
add3 <- function(x, y, z){
    add <- x + y + z
    return(add)
}
add3(1, 2, 3)



func1 <- function(x){
    use <- x > 12
    x[use]
    
    if(x > 1){
        
    }
}
func2 <- function(x, n){
    use <- x > n
    x[use]
}

func2(1:20, 15)
colmean <- function(x){
    nc <- ncol(x)
    means <- numeric(nc)
    for (i in 1:nc){
        means[i] = mean(x[, i],  na.rm = TRUE)
    }
    print(means)
}
colmean(airquality)

#Lazy Evaluation
f <- function(a, b){
    a^4
}
f(2)

#Lexical Scoping
pow1 <- function(n){
    pow2 <- function(x){
        x^n
    }
    pow2
}


