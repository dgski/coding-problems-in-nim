# An XOR linked list is a more memory efficient doubly linked list. Instead of each node holding next and prev fields,
# it holds a field named both, which is a XOR of the next node and the previous node. Implement a XOR linked list;
# it has an add(element) which adds the element to the end, and a get(index) which returns the node at index.

# If using a language that has no pointers (such as Python), 
# assume you have access to get_pointer and dereference_pointer functions that converts between nodes and memory addresses.

type
    Node[T] = object
        data: T
        compass: int

proc get[T](root: ref Node[T], index: int): ref Node[T] =
    var
        currentNode = root
        currentAddress = cast[int](currentNode)
        previousAddress = 0
        nextNode = cast[ref Node[T]](currentNode.compass xor previousAddress)
        i = 0;
    
    while nextNode != nil and i != index:
        previousAddress = currentAddress
        currentNode = nextNode
        nextNode = cast[ref Node[T]](currentNode.compass xor currentAddress)
        currentAddress = cast[int](currentNode)
        inc i
    
    if i == index: return currentNode
    else: return nil

proc add[T](root: ref Node[T], data: T): ref Node[T] {.discardable.}=

    var
        currentNode = root
        currentAddress = cast[int](currentNode)
        previousAddress = 0
        nextNode = cast[ref Node[T]](currentNode.compass xor previousAddress)
    
    while nextNode != nil:
        previousAddress = currentAddress
        currentNode = nextNode
        nextNode = cast[ref Node[T]](currentNode.compass xor currentAddress)
        currentAddress = cast[int](currentNode)

    #Add element
    var newNode = new Node[T]
    newNode.data = data
    newNode.compass = currentAddress xor 0
    currentNode.compass = previousAddress xor cast[int](newNode)

    return newNode

proc print[T](root: ref Node[T]) =
    #Setup traversal
    var
        currentNode = root
        currentAddress = cast[int](currentNode)
        previousAddress = 0
        nextNode = cast[ref Node[T]](currentNode.compass xor previousAddress)
    
    #Traverse
    while nextNode != nil:
        stdout.write currentNode.data, ","
        previousAddress = currentAddress
        currentNode = nextNode
        nextNode = cast[ref Node[T]](currentNode.compass xor currentAddress)
        currentAddress = cast[int](currentNode)
    
    stdout.write currentNode.data
    echo ""

#Create Node
var root = new Node[int]
root.data = 1
root.add(2)
root.add(3)
root.add(4)
root.add(5)
root.add(6)

root.print

echo root.get(5).data
