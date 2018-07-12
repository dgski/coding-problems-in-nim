# Write an algorithm to justify text. Given a sequence of words and an integer line length k, return a list of strings which represents each line, fully justified.

# More specifically, you should have as many words as possible in each line. There should be at least one space between each word. Pad extra spaces when necessary so that each line has exactly length k. Spaces should be distributed as equally as possible, with the extra spaces, if any, distributed starting from the left.

# If you can only fit one word on a line, then you should pad the right-hand side with spaces.

# Each word is guaranteed not to be longer than k.

# For example, given the list of words ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"] and k = 16, you should return the following:

# ["the  quick brown", # 1 extra space on the left
# "fox  jumps  over", # 2 extra spaces distributed evenly
# "the   lazy   dog"] # 4 extra spaces distributed evenly

import strutils

#Justifies the text to the given k
proc justify [S,](input: array[S,string], k: int): seq[string] =
    result = @[]
    var i = 0

    var to_add = newSeq[string]()
    var currLen = 0

    while i < input.len:
        echo i, " : ",input[i]
        if currLen == 0 and input[i].len <= k:
            to_add.add(input[i])
            currLen += input[i].len
            inc i
        elif currLen + input[i].len <= (k - to_add.len - 1):
            to_add.add(input[i])
            currLen += input[i].len
            inc i

        if i > input.high or currLen + input[i].len > (k - to_add.len - 1):
            echo "END OF LINE!"
            echo to_add
            var numOfSpaces = k - currLen
            var index = 0
            for i in 0..numOfSpaces-1:
                to_add[index].add(" ")
                inc index
                if index > to_add.high - 1: index = 0

            echo "NUM OF SPACES:", numOfSpaces
            result.add(to_add.join())
            to_add = @[]
            currLen = 0        
    



var sample = ["the", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog"]

echo sample.justify(16)
