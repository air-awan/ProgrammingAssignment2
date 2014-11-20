## These functions are working together to return inverse matrix value
## To use:
## 1. Call makeCacheMatrix with square matrix as input, assign the output to an object
## 2. Call cacheSolve with result of no 1 as input
## 3. When you need to recall the result, just run no. 2 again

## This function will return a list which contains function:
## set: set the matrix with value from input
## get: get the matrix value
## setInverse: set the cacheInverse (inverse matrix) value
## getInverse: get the cacheInverse (inverse matrix) value

makeCacheMatrix <- function(cacheMatrix = matrix()) {
    cacheInverse <- NULL
    set <- function(y) {
        cacheMatrix <<- y
        cacheInverse <<- NULL
    }
    get <- function() cacheMatrix
    setInverse <- function(solve) cacheInverse <<- solve
    getInverse <- function () cacheInverse
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

## This function will return inverse matrix value
## from cache if available, marked with message "Cached Inverse"
## or from calculation with message "Calculated Inverse"

cacheSolve <- function(cache) {
    inverse <- cache$getInverse()
    if(!is.null(inverse)) {
        message("Cached Inverse")
        return(inverse)        
    }
    data <- cache$get()
    inverse <- solve(data)
    cache$setInverse(inverse)
    message("Calculated Inverse")
    inverse
}
