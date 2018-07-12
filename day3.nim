# Given the root to a binary tree, implement serialize(root), which serializes the tree into a string, and deserialize(s), 
# which deserializes the string back into the tree.

import strutils

#Create binary tree
type
    Node[T] = object
        data: T
        right, left: ref Node[T]

proc newNode [T](data: T, left, right: (ref Node[T]) = nil): ref Node[T] =
     (ref Node[T])(data: data, left: left, right: right)

proc traverse [T](node: (ref Node[T])) =
    
    if node.left != nil: traverse node.left
    echo node.data
    if node.right != nil: traverse node.right 

let root = newNode(5,newNode(2, newNode(1)), newNode(10, newNode(7)))

traverse root

proc serialize [T](node: (ref Node[T])): string =
    result = "{"
    result.add($node.data & ":")
    if node.left != nil: result.add(serialize node.left)
    result.add(",")
    if node.right != nil: result.add(serialize node.right)
    result.add("}")

let treeString = serialize root
echo treeString


proc deserialize (input: string, depth: int): ref Node[int] =

    var root: ref Node[int]
    var goingRight, inObject = false
    var data = ""
    
    proc findObjEnd(ourInput: string): int=
        var b,e = 0
        for i,j in ourInput:
            case j:
            of '{': inc(b)
            of '}': inc(e)
            else: discard 
            if b == e:
                return  i

    var pos = 0
    while true:
        case input[pos]:
        of '{':
            if not inObject: (root = newNode(0); inObject = true)
            else:
                var newString = input[pos..(findObjEnd(input[pos..input.high]) + pos)];
                if goingRight:
                    root.right = deserialize( newString , depth + 1)
                else:
                    root.left = deserialize(newString, depth + 1)
                pos = pos + newString.high
        of '}': return root
        of ',': goingRight = true
        of ':': discard
        else:
            if input[pos] in ('0'..'9'):
                data.add(input[pos])
            if (not (pos + 1 > input.high)) and not (input[pos + 1] in ('0'..'9')):
                root.data = parseInt(data)
                data = ""
        inc pos


let root2 = newNode(5,newNode(2),newNode(1))
let string2 = serialize root2

let rootNew = deserialize(treeString,0)


traverse rootNew