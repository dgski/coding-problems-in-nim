# Implement an autocomplete system. That is, given a query string s and a set of all possible query strings,
# return all strings in the set that have s as a prefix.
# For example, given the query string de and the set of strings [dog, deer, deal], return [deer, deal].
# Hint: Try preprocessing the dictionary into a more efficient data structure to speed up queries.
import strutils

#Implement Trie
type
    Node = object
        isWord: bool
        letters: array[26,ref Node]


#Add word to this tree
proc add(root: ref Node, input: string, currentLetter: int = 0) =
    if currentLetter == input.len:
        root.isWord = true
        return
    var index = ord(input[currentLetter]) - 97
    if root.letters[index] == nil:
        root.letters[index] = new Node
    root.letters[index].add(input, currentLetter + 1)

#List all words under this root
proc members(root: ref Node): seq[string] =
    result = @[]
    for i,j in root.letters:
        if j != nil:
            var newMem = j.members
            if newMem.len == 0:
                result.add($char(i + 97))
            for x in newMem:
                result.add($char(i + 97) & x)

#Find the node which starts the end of the string
proc findtail(root: ref Node, input: string, currentLetter: int = 0): ref Node =
    echo input[currentLetter]
    if currentLetter == input.len:
        return root
    if root.letters[ord(input[currentLetter]) - 97] != nil:
        return root.letters[ord(input[currentLetter]) - 97].findtail(input, currentLetter + 1)
    else:
        return nil

#Find the rest of the words
proc autocomplete(root: ref Node, input: string): seq[string] =
    result = @[]
    for i in root.findtail(input).members:
        result.add(input & i)

#Simple version
proc autocomplete(query: string, dictionary: seq[string]): seq[string] =
    result = @[]
    for i in dictionary:
        if query in i:
            result.add(i)



echo autocomplete("de", @["dog","deer","deal"])

var ourDict = new Node

ourDict.add("dog")
ourDict.add("deal")
ourDict.add("deer")
echo repr ourDict

echo ourDict.autocomplete("de")


