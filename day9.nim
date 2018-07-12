# Given a list of integers, write a function that returns the largest sum of non-adjacent numbers.
# Numbers can be 0 or negative.

# For example, [2, 4, 6, 8] should return 12, since we pick 4 and 8.
# [5, 1, 1, 5] should return 10, since we pick 5 and 5.

proc largestNonAdjSum[S, int](input: array[S, int]): int =
    var incl = 0
    var excl = 0
    
    for i in input:
        var new_excl = if excl > incl: excl else: incl
        incl = excl + i
        excl = new_excl
    
    return if excl > incl: excl else: incl


var exA = [2,4,6,8]
var exB = [5,1,1,5]
var exC = [10,3,6,7,8,11,9]

echo largestNonAdjSum exA
echo largestNonAdjSum exB
echo largestNonAdjSum exC
