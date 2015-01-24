source('cachematrix.R')

m <- matrix(c(4,3,3,2), 2, 2)
print("m = ")
print(m)
 
cm <- makeCacheMatrix(m)
print('inverted m =')
print(cacheSolve(cm))

m2 <- matrix(1:16, 4, 4)

cm2 <- makeCacheMatrix(m2)

## will cause error, m2 is singular 
cacheSolve(cm2)

m3 <- matrix(1:4, 2, 2)
cm3 <- makeCacheMatrix(m3)
cacheSolve(cm3)
