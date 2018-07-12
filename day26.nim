#Given a singly linked list and an integer k, remove the kth last element from the list. k is guaranteed to be smaller than the length of the list.
#The list is very long, so making more than one pass is prohibitively expensive.
#Do this in constant space and in one pass.

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

proc removeNode(toDelete, prev, next: ref Node) =
    prev.next = next


proc clearIndexFromBack(root: ref Node,index: int): ref Node=
    var toDeletePrev, tracker: ref Node
    var counter = 0
    tracker = root
    toDeletePrev = new Node
    toDeletePrev.next = root

    while tracker != nil:
        echo index
        echo counter
        if tracker.next == nil:
            if toDeletePrev.next == root:
                return root.next
            else:
                removeNode(toDeletePrev.next,toDeletePrev, toDeletePrev.next.next)
        
        tracker = tracker.next

        if counter == index:
            echo "Advancing"
            toDeletePrev = toDeletePrev.next
        else:
            inc counter
    
    return root



var rootOne = createNode(1)
discard rootOne.appendNode(createNode(2)).appendNode(createNode(3)).appendNode(createNode(4))

echo repr rootOne
rootOne = rootOne.clearIndexFromBack(2)
echo repr rootOne
