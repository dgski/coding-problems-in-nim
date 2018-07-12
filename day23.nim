#You are given an M by N matrix consisting of booleans that represents a board. Each True boolean represents a wall. Each False boolean represents a tile you can walk on.
#Given this matrix, a start coordinate, and an end coordinate, return the minimum number of steps required to reach the end coordinate from the start. If there is no possible path, then return null. You can move up, left, down, and right. You cannot move through walls. You cannot wrap around the edges of the board.
#For example, given the following board:
# [[f, f, f, f],
# [t, t, f, t],
# [f, f, f, f],
# [f, f, f, f]]
#and start = (3, 0) (bottom left) and end = (0, 0) (top left), the minimum number of steps required to reach the end is 7, since we would need to go through (1, 2) because there is a wall everywhere else on the second row.




#Find minimal steps from this point to end
proc minSteps[Y,X](theMap: array[Y, array[X,bool]], curr: array[2,int], dest: array[2,int], alreadyVisited: seq[array[2,int]] = @[]): int =

    result = -1

    #Base case -> we are at destination
    if (curr[1] == dest[1]) and (curr[0] == dest[0]):
        return 0

    #Base case -> we've already seen this coordinate
    if curr in alreadyVisited:
        return
    
    #Make copy of already visited coordinates and add your self
    var newVisited = alreadyVisited
    newVisited.add(curr)

    var steps: int

    #Check right
    if curr[1] + 1 <= X.high and not theMap[curr[0]][curr[1] + 1]:
        steps = theMap.minSteps([curr[0],curr[1] + 1], dest, newVisited)
        if steps == -1: discard
        elif result == -1 or result > steps: result = steps + 1

    #Check left
    if curr[1] - 1 >= 0 and not theMap[curr[0]][curr[1] - 1]:
        steps = theMap.minSteps([curr[0],curr[1] - 1], dest, newVisited)
        if steps == -1: discard
        elif result == -1 or result > steps: result = steps + 1

    #Check top
    if curr[0] - 1 >= 0 and not theMap[curr[0] - 1][curr[1]]:
        steps = theMap.minSteps([curr[0] - 1,curr[1]], dest, newVisited)
        if steps == -1: discard
        elif result == -1 or result > steps: result = steps + 1

    #Check bottom
    if curr[0] + 1 <= Y.high and not theMap[curr[0] + 1][curr[1]]:
        steps = theMap.minSteps([curr[0] + 1,curr[1]], dest, newVisited)
        if steps == -1: discard
        elif result == -1 or result > steps: result = steps + 1


var sampleBoard_1 = [[false, false, false, false],

                [true, true, false, true],

                [false, false, false, false],

                [false, false, false, false]]

var sampleBoard_2 = [[false, false, false],

                    [true, true, false],

                    [false, false, false]]

var sampleBoard_3 = [[false, false],

                    [true, false]]




                
echo "min step(s): ", sampleBoard_1.minSteps([3,0], [0,0])
echo "min step(s): ", sampleBoard_2.minSteps([0,0], [2,2])
echo "min step(s): ", sampleBoard_3.minSteps([0,0], [1,1])

