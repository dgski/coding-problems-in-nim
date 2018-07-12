#Given an array of integers, find the first missing positive integer in linear time and constant space. 
#In other words, find the lowest positive integer that does not exist in the array. The array can contain duplicates and negative numbers as well.
#For example, the input [3, 4, -1, 1] should give 2. The input [1, 2, 0] should give 3.
#You can modify the input array in-place.
import algorithm

var arrTest1 = [3,4,-1,1]
var arrTest2 = [1,2,0]

proc findLowestInt [S,](arr: var array[S, int]): int =
    arr.sort(system.cmp)
    for i in arr:
        if i > 0 and result == 0 and i + 1 > result:
            result = i + 1
        elif i == result:
            inc result

echo findLowestInt(arrTest1)
echo findLowestInt(arrTest2)