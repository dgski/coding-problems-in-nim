# Given an array of time intervals (start, end) for classroom lectures (possibly overlapping), find the minimum number of rooms required.
# For example, given [(30, 75), (0, 50), (60, 150)], you should return 2.
import tables, algorithm


proc minRooms [S,T](lectures: array[S,T]): int =
    var starts = newTable[int,int]()
    var ends = newTable[int,int]()

    for i in lectures:
        if i[0] in starts: inc starts[i[0]]
        else: starts[i[0]] = 1
        if i[1] in ends: inc ends[i[0]]
        else: ends[i[1]] = 1

    for i,j in lectures:
        var maxRooms = 0
        var roomsNow = 0
        for x in j[0]..j[1]:
            if x in starts:
                roomsNow += starts[x]
            if x in ends:
                roomsNow -= ends[x]
            if roomsNow > maxRooms: maxRooms = roomsNow
        if maxRooms > result:
            result = maxRooms
    
#Sorting Example
#[
proc byEndTime(x,y:T): int =
    if x[1] > y[1]:
        return 1
    var inOrder = lectures.sorted(byEndTime)
]#
                


var lectures = [(30,75), (0,50) , (60,150) ]

echo lectures.minRooms
