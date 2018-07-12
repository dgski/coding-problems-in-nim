# Given an array of integers and a number k, where 1 <= k <= length of the array, compute the maximum values of each subarray of length k.
# For example, given array = [10, 5, 2, 7, 8, 7] and k = 3, we should get: [10, 7, 8, 8], since:

# 10 = max(10, 5, 2)
# 7 = max(5, 2, 7)
# 8 = max(2, 7, 8)
# 8 = max(7, 8, 7)

# Do this in O(n) time and O(k) space. You can modify the input array in-place and you do not need to store the results. You can simply print them out as you compute them.
import deques


proc printSubArrMaxes(arr: var seq[int], k: int) =
    
    var Qi = initDeque[int]()


    for i in 0..k-1:
        while Qi.len > 0 and arr[i] >= arr[Qi.peekLast]:
            Qi.popLast()
        echo "adding: ", arr[i]
        Qi.addLast(i)

    for i in k..arr.high:
        echo arr[Qi.peekFirst]

        while Qi.len > 0 and Qi.peekFirst <= i-k:
            Qi.popFirst

        while Qi.len > 0 and arr[i] >= arr[Qi.peekLast]:
            Qi.popLast

        Qi.addLast(i)

    echo arr[Qi.peekFirst]



proc subArrMaxes(input: seq[int], k: int): seq[int] =
    result = @[]
    var
        start = 0
        final = k - 1

    while final < input.len:
        result.add(input[start..final].max)
        inc start;inc final

var sample = @[10,5,2,7,8,7]

echo sample.subArrMaxes(3)
sample.printSubArrMaxes(3)