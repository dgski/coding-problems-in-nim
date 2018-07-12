#Given an array of integers, return a new array such that each element at index i of the new array is the product of all the numbers in the 
#original array except the one at i. Solve it without using division and in O(n) time.
#
#For example, if our input was [1, 2, 3, 4, 5], the expected output would be [120, 60, 40, 30, 24].
#If our input was [3, 2, 1], the expected output would be [2, 3, 6].

import math

var arr1 = [1,2,3,4,5]
var arr2 =  [3,2,1]

proc exclusiveProduct [S,](arr: array[S,int]): array[S,int] =

    for loc,i in arr: result[loc] = 1
    var
        prodLeft = 1
        prodRight = 1
        len = arr.high
        leftMult: int
        rightMult: int

    for i in 0..arr.high:
        leftMult = arr[i]
        rightMult = arr[len - i]
        result[i] *= prodLeft
        result[len - i] *= prodRight
        prodLeft *= leftMult
        prodRight *= rightMult

echo repr exclusiveProduct(arr1)
echo repr exclusiveProduct(arr2)