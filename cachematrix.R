## These functions provide a mechanism for under-the-hood caching of the result
## of the potentially expensive inverse operation for a given matrix.

## This is the function to create an object for a matrix. The result will be
## used to get the inverse of the matrix.
makeCacheMatrix <- function(x = matrix()) {
    #initialize the inverse to NULL. Better to be lazy while possible.
    inv<-NULL;

    #subfunction is used to escape re-initialization of the inverse.
    getInv<-function(){
        
        #if the inverse has not yet been calculated, gotta do it now.
        if(is.null(inv)){
            inv<<-solve(x)
        }
        
        #return the inverse.
        inv
    }

    #return the subfunction as an object.
    getInv
}


## Use an object returned by makeCacheMatrix, and return the inverse of the
## matrix that was passed to it to create the object.
cacheSolve <- function(x) {

    #the object is in fact a function, which returns the inverse when called. 
    x()
}
