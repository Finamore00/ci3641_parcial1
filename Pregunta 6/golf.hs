import Prelude
fi x _ 1 = x
fi _ _ 0 = 0
fi x y k = fi (x+y) x (k-1)
fa 0 = 1
fa n = n*fa (n-1)
bc n k = if k > n then 0 else div (fa n) (fa k * fa (n-k))
na n k = div (bc n k* bc n (k-1)) n
lf = floor . logBase 2 . fromIntegral
w n = fi 1 0 (lf (na (n+1) (n-1)) + 1)