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
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## cacheSolve function is the place where the calculation (and assignment) of the inverse matrix actually happens
## Of course, only if the inverse matrix is not known yet.
## NB: The calculation itself is delegated to R's standard solve function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
		
		inv <- x$getinverse()
        if(!is.null(inv)) {
                return(inv)
        }
        data <- x$get()
        inv <- solve(data, ...)
        x$setinverse(inv)
        inv
}
