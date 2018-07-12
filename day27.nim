# Given a string of round, curly, and square open and closing brackets, return whether the brackets are balanced (well-formed).
# For example, given the string "([])[]({})", you should return true.
# Given the string "([)]" or "((()", you should return false.



#Given a a string input, check whether the brackets are balanced
proc balanced(input: string): bool =

    result = true
    var symbols = newSeq[char]()

    for i in input:
        case i:
        of '(': symbols.add(')')
        of '[': symbols.add(']')
        of '{': symbols.add('}')
        of ')',']','}':
            if symbols.len == 0: return false
            if symbols[symbols.high] == i:  discard symbols.pop
            else:   return false
        else: return false
        
    if symbols.len != 0: return false

        
        




var sampleOne = "([])[]({})"
var sampleTwo = "([)]"
var sampleThree = "((()"

echo sampleOne.balanced
echo sampleTwo.balanced
echo sampleThree.balanced