# You are given an array of non-negative integers that represents a two-dimensional elevation map where each element is unit-width wall and the integer is the height. Suppose it will rain and all spots between two walls get filled up.

# Compute how many units of water remain trapped on the map in O(N) time and O(1) space.

# For example, given the input [2, 1, 2], we can hold 1 unit of water in the middle.

# Given the input [3, 0, 1, 3, 0, 5], we can hold 3 units in the first index, 2 in the second, and 3 in the fourth index (we cannot hold 5 since it would run off to the left), so we can trap 8 units of water.

import algorithm


proc rain[S,int](walls: array[S,int]): int =
    #Precompute left
    var left: array[walls.len,int]
    left[0] = walls[0];
    for i in 1..walls.high:
        left[i] = max(left[i-1], walls[i]);

    #Precompute right
    var right: array[walls.len,int]
    right[walls.high] = walls[walls.high];
    for i in countdown(walls.high-1,0):
        right[i] = max(right[i+1], walls[i]);
    
    for i in 0..walls.high:
        echo min(left[i],right[i]) - walls[i];
        result += min(left[i],right[i]) - walls[i];

proc findWater[S,int](arr: array[S,int]): int =
        
    # maximum element on left and right
    var left_max = 0
    var right_max = 0
        
    #indices to traverse the array
    var lo, hi:int
    hi = arr.high
        
    while lo <= hi: 
        if(arr[lo] < arr[hi]):
            if(arr[lo] > left_max):
                # update max in left
                left_max = arr[lo]
            else:
            # water on curr element = max - curr
                result += left_max - arr[lo]
                inc lo
        else:
            if(arr[hi] > right_max):
                #update right maximum
                right_max = arr[hi]
            else:
                result += right_max - arr[hi]
                dec hi
        
    return result


var sample1 = [2,1,2]
var sample2 = [3,0,1,3,0,5]
var sample3 = [2,0,3,0,2]

#echo sample1.rain
#echo sample2.rain
#echo sample3.rain

echo sample1.findWater
echo sample2.findWater
echo sample3.findWater