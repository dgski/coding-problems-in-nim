# Given an array of numbers, return whether any two sums to K.
#For example, given [10, 15, 3, 7] and K of 17, return true since 10 + 7 is 17.

let testArray = [10,15, 3,7]
let K = 17

proc anyTwoSumstoK [I,](arr: array[I,int], K: int): bool =

    for loc_1,i in arr.pairs:
        for loc_2,j in arr.pairs:
            if (i + j == K) and (loc_1 != loc_2): return true
    
    return false

echo anyTwoSumstoK(testArray,K)
