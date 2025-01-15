CircularQueue <- setRefClass(
    "CircularQueue",
    fields = list(
        queue = "list",
        maxSize = "numeric",
        head = "numeric",
        tail = "numeric"
    ),
    methods = list(
        initialize = function(maxSize) {
            queue <<- vector("list", maxSize)
            maxSize <<- maxSize
            head <<- -1
            tail <<- -1
        },
        enqueue = function(data) {
            if ((tail + 1) %% maxSize == head) {
                cat("Circular Queue is full\n")
            } else if (head == -1) {
                head <<- 0
                tail <<- 0
                queue[[tail + 1]] <<- data
            } else {
                tail <<- (tail + 1) %% maxSize
                queue[[tail + 1]] <<- data
            }
        },
        dequeue = function() {
            if (head == -1) {
                cat("Circular Queue is empty\n")
                return(NULL)
            } else if (head == tail) {
                temp <- queue[[head + 1]]
                head <<- -1
                tail <<- -1
                return(temp)
            } else {
                temp <- queue[[head + 1]]
                head <<- (head + 1) %% maxSize
                return(temp)
            }
        }
    )
)