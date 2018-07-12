#A builder is looking to build a row of N houses that can be of K different colors. He has a goal of minimizing cost while ensuring that no two neighboring houses are of the same color.
#Given an N by K matrix where the nth row and kth column represents the cost to build the nth house with kth color, return the minimum cost which achieves this goal.

#Find the minimum cost of contruction within this matrix
proc minCost[S,Z](houses: array[Z,array[S,int]]): int =
    var previousColor = -1
    for h in houses:
        var lowest = -1
        for i,colorCost in h:
            if lowest == -1: lowest = i
            elif i != previousColor and colorCost < h[lowest]: lowest = i
        previousColor = lowest
        result += h[lowest]
        


var houseMatrix =[[100,120,300,230,200],
                [230,110,125,200,100],
                [340,320,250,210,90],
                [100,200,300,400,1000],
                [250,120,660,125,220]]

echo houseMatrix.minCost()