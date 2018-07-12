# Implement locking in a binary tree. A binary tree node can be locked or unlocked only if all of its descendants or ancestors are not locked.

# Design a binary tree node class with the following methods:

# - is_locked, which returns whether the node is locked
# - lock, which attempts to lock the node. If it cannot be locked, then it should return false. Otherwise, it should lock it and return true.
# - unlock, which unlocks the node. If it cannot be unlocked, then it should return false. Otherwise, it should unlock it and return true.

# You may augment the node to add parent pointers or any other property you would like. You may assume the class is used in a single-threaded program, so there is no need for actual locks or mutexes. Each method should run in O(h), where h is the height of the tree.

# LOCKABLE NODE CLASS

type
    Node[T] = object
        locked: bool
        data: T
        left,right, parent: ref Node[T]

#Create new node
proc newNode[T](data: T, left,right: ref Node[T] = nil): ref Node[T] =
    result = (ref Node[T])(data: data, left: left, right: right)
    if result.left != nil:
        result.left.parent = result
    if result.right != nil:
        result.right.parent = result

#Checks whether this node is locked or not
proc is_locked[T](input: ref Node[T]): bool =
    input.locked

#Checks whether the children of this node are locked
proc children_locked[T](input: ref Node[T]): bool =

    if input.left == nil and input.right == nil:
        return false
    
    if input.left == nil:
        return input.right.locked or input.right.children_locked

    if input.right == nil:
        return input.left.locked or input.left.children_locked

    return input.left.locked or input.left.children_locked or input.right.locked or input.right.children_locked

#Checks whether the parents of this node are locked
proc parents_locked [T](input: ref Node[T]): bool = 
    var traverser = input.parent
    while traverser != nil:
        if traverser.is_locked: return true
        traverser = traverser.parent
    return false


#Attempts to lock the the node
proc lock[T](input: ref Node[T]): bool = 
    if input.parents_locked or input.children_locked:
        return false

    input.locked = true
    return true

#Attempts to unlock the node
proc unlock[T](input: ref Node[T]): bool =

    if input.parents_locked or input.children_locked:
        return false
    
    input.locked = false
    return true


var randomChild = newNode(10, newNode(1), newNode(1))
var root = newNode(6,newNode(3), randomChild)


echo repr root

echo "Is root locked: ", root.is_locked
echo "Attempting to lock root: ", root.lock
echo "Is root locked: ", root.is_locked
echo "Attempting to unlock root: ", root.unlock
echo "Attemping to lock randomChild: ", randomChild.lock
echo "Attempign to lock root: ", root.lock