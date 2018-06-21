## Put comments here that give an overall description of what your
## functions do

## This function acts like a container for setting and getting the matrix and its inverse

makeCacheMatrix <- function(cachedMatrix = cachedMatrix()) {
  cachedInverse <- NULL
  setMatrix <- function(newMatrix) {
    cachedMatrix <<- newMatrix
    cachedInverse <<- NULL
  }
  getMatrix <- function() cachedMatrix
  setInverse <- function(newInverse) cachedInverse <<- newInverse
  getInverse <- function() cachedInverse
  list(setMatrix = setMatrix, 
       getMatrix = getMatrix,
       setInverse = setInverse,
       getInverse = getInverse)
}

## Write a short comment describing this function

## Return a matrix that is the inverse of 'x'
cacheSolve <- function(container, ...) {
    inverse <- container$getInverse()
    if(!is.null(inverse)) {
      message("getting cached data")
      inverse
    } else {
      matrix <- container$getMatrix()
      inverse <- solve(matrix)
      container$setInverse(inverse)
      inverse
    }
}
