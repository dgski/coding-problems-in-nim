# Given two singly linked lists that intersect at some point, find the intersecting node. The lists are non-cyclical.
# For example, given A = 3 -> 7 -> 8 -> 10 and B = 99 -> 1 -> 8 -> 10, return the node with value 8.
# In this example, assume nodes with the same value are the exact same node objects.
# Do this in O(M + N) time (where M and N are the lengths of the lists) and constant space.

import tables

#Create linked list
type
    Node = object
        value: int
        next: ref Node

proc createNode(input: int): ref Node =
    result = new Node
    result.value = input

proc appendNode(root: ref Node, input: ref Node): ref Node =
    root.next = input
    return root.next


#Create our linked lists
var intersectionPoint = createNode(8)
discard intersectionPoint.appendNode(createNode(10))

var rootOne = createNode(3)
discard rootOne.appendNode(createNode(7)).appendNode(intersectionPoint)

var rootTwo = createNode(99)
discard rootTwo.appendNode(createNode(1)).appendNode(intersectionPoint)

echo repr rootOne
echo repr rootTwo

#Procedure that finds the intersection point given two linked lists
proc findIntersection(rootOne, rootTwo: ref Node): ref Node =
    var visitedNodes = newTable[int, bool]()

    var traveser =  rootOne
    while traveser != nil:
        visitedNodes[cast[int](traveser)] = true
        traveser = traveser.next

    traveser = rootTwo
    while traveser != nil:
        if cast[int](traveser) in visitedNodes: return traveser
        traveser = traveser.next

echo repr findIntersection(rootOne, rootTwo)
            