#matrix is very similar with data.frame, but the biggest difference is that matrix must contain
#identical data type elements inside but data.frame doesn't

# create a 5x2 matrix
A <- matrix(1:10, nrow = 5)
B <- matrix(21:30, nrow = 5)
C <- matrix(21:40, nrow = 2)
A; B; C

nrow(A)
ncol(A)
dim(A)

A + B
A * B # elements multiplication
A == B # check if each element in A and B is equal

# matrix multiplication(inner product)
# A is 5x2, and B is 5x2, so B has to be transposed
A %*% t(B)   # %*% is multiple operator of matrix inner product, and t() is transpose function

# name assign methods in common between data.frame and matrix
colnames(A)
rownames(A)
colnames(A) <- c("Left", "Right")
rownames(A) <- c("1st", "2nd", "3rd", "4th", "5th")

colnames(B)
rownames(B)
colnames(B) <- c("First", "Second")
rownames(B) <- c("One", "Two", "Three", "Four", "Five")

colnames(C)
rownames(C)
colnames(C) <- LETTERS[1:10]  # vector LETTERS means c("A", "B", ..., "Z"), letters means c("a", "b", ..., "z")
rownames(C) <- c("Top", "Bottom")

t(A)
A %*% C # keep row names of left matrix and column names of right matrix
