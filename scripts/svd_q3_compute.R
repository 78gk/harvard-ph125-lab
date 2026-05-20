set.seed(1986)
N<-100
p<-24
group_means<-c(rep(3,8), rep(0,8), rep(-3,8))
y<-matrix(rnorm(N*p,0,1), N, p) + matrix(rep(group_means, each=N), N, p)
y<-y - mean(y)
# compute SVD
s <- svd(y)
# sum of squares of columns of y
ss_y <- colSums(y^2)
# transformed YV
yv <- y %*% s$v
ss_yv <- colSums(yv^2)
cat('sum(ss_y) =', sum(ss_y), '\n')
cat('sum(ss_yv) =', sum(ss_yv), '\n')
