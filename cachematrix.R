## makeCacheMatrix and cacheSolve function pair provides a cached matrix inversion calculation
##

## makeCacheMatrix function is a constructor of a special "matrix" object with the capabilities to
## set/get the square invertible matrix
## setinverse/getinverse controls the inverse matrix 

makeCacheMatrix <- function(x = matrix()) {

		inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setInverse <- function(inverse) inv <<- inverse
        getInverse <- function() inv
        list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## cacheSolve function is the place where the calculation (and cache assignment) of the inverse matrix actually happens
## Of course, only if the inverse matrix is not known yet.
## NB: The calculation itself is delegated to R's standard solve function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		
		inv <- x$getInverse()
        if(!is.null(inv)) {
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setInverse(inv)
        inv
}
