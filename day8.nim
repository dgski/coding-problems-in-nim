# A unival tree (which stands for "universal value") is a tree where all nodes have the same value.
# Given the root to a binary tree, count the number of unival subtrees.

type
    Node[T] = object
        data: T
        left, right: ref Node[T]

proc newNode [T](data: T, left, right: ref Node[T] =  nil): ref Node[T] =
    (ref Node[T])(data: data, left: left, right: right)

proc allTheSame [T](root: ref Node[T]): bool =
    if root.left == nil and root.right == nil: return true
    if root.left == nil and root.data == root.right.data and allTheSame(root.right) == true: return true
    if root.right == nil and root.data == root.left.data and allTheSame(root.left) == true: return true
    if root.data == root.right.data and root.data == root.left.data and allTheSame(root.left) and allTheSame(root.right): return true
    return false

proc numOfUniSubTrees [T](root: ref Node[T]): int =
    if root == nil: return 0
    echo "value:", root.data
    var left = numOfUniSubTrees(root.left)
    var right = numOfUniSubTrees(root.right)
    if allTheSame(root): return 1 + left + right
    else: return left + right
    


var root = newNode(3,

            newNode(2, 
                newNode(2, newNode(2), newNode(2)),
                newNode(2, newNode(2), newNode(2))),
            newNode(4,
                newNode(4, newNode(4), newNode(4)),
                newNode(6, newNode(6), newNode(6, newNode(6), newNode(37))))

                )

var test = newNode(1, newNode(1), newNode(1))

var test2 = newNode('a', 
                newNode('a'),                
                newNode('a',
                    newNode('a'),
                    newNode('a', nil, newNode('A'))
                    )
                    )
                
var test3 = newNode('a')

echo numOfUniSubTrees(test3)
echo allTheSame(root)