## These functions are working together to return inverse matrix value
## To use:
## 1. Call makeCacheMatrix with square matrix as input, assign the output to an object
## 2. Call cacheSolve with result of no 1 as input
## 3. When you need too recall the result, just run no. 2 again

## This function will return a list which contains function:
## set: set the matrix with value from input
## get: get the matrix value
## setsolve: set the solve (inverse matrix) value
## getsolve: get the solve (inverse matrix) value

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) m <<- solve
    getsolve <- function () m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}

## This function will return inverse matrix value
## from cache with message "getting cached data"
## or from calculation without message

cacheSolve <- function(x) {
    m <- x$getsolve()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)        
    }
    data <- x$get()
    m <- solve(data)
    x$setsolve(m)
    m
}
