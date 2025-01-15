PriorityQueue <- setRefClass(
  "PriorityQueue",
  fields = list(
    heap = "list",
    compare = "function"
  ),
  methods = list(
    initialize = function(compare) {
      if (!is.function(compare)) {
        stop("Compare has to be a function")
      }
      heap <<- list()
      compare <<- compare
    },
    getParentIndex = function(index) {
      return((index - 1) %/% 2)
    },
    getLeftChildIndex = function(index) {
      return(2 * index + 1)
    },
    getRightChildIndex = function(index) {
      return(2 * index + 2)
    },
    swap = function(index1, index2) {
      temp <- heap[[index1]]
      heap[[index1]] <<- heap[[index2]]
      heap[[index2]] <<- temp
    }
  )
)