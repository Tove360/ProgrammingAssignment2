## This program calculate a inver of a matrix

## This fuction set the function and the variables 

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setsolve <- function(sol) s <<- sol
    getsolve <- function() s
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## This function use the list created in the last funtion to calculate the inverse matrix 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    s <- x$getsolve()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setsolve(s)
    s
}

## Test
mat <- matrix(c(1:4), nrow=2, ncol=2)
z <- makeCacheMatrix(mat)
cacheSolve(z)
cacheSolve(z)