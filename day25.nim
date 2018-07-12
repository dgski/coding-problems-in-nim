# Implement regular expression matching with the following special characters:

# - . (period) which matches any single character
# - * (asterisk) which matches zero or more of the preceding element
# That is, implement a function that takes in a string and a valid regular expression and returns whether or not the string matches the regular expression.

# For example, given the regular expression "ra." and the string "ray", your function should return true. The same regular expression on the string "raymond" should return false.

# Given the regular expression ".*at" and the string "chat", your function should return true. The same regular expression on the string "chats" should return false.

#If chars match
proc matches(input: char, regex: char): bool =
    if regex == '.': return true
    else: return input == regex

#Simplest regular expression tool
proc regex(expression: string, input: string): bool =
    result = true
    var wordIndex = 0
    var i = 0

    echo expression, " matches ", input

    while i < expression.len:
        #Handle "*" operator
        if (i + 1) < expression.len and expression[i+1] == '*':
            while wordIndex < input.len and matches(input[wordIndex],expression[i]):
                inc wordIndex
                if (i + 2 < expression.len) and expression[i + 2] == input[wordIndex]:
                    break
            inc i #Skip * operator for next round
        
        #Character matches
        elif matches(input[wordIndex],expression[i]):
            inc wordIndex
        
        #Character doesn't match
        else:
            return false
        
        #Increment index
        inc i

        #We've reached end of word
        if wordIndex > input.high: break

    #Either chars left in word, or chars left in expression
    if wordIndex != input.len or i != expression.len: return false

        


        


echo regex("i.*","input")
echo regex("dog..","dogi")
echo regex("ra.","ray")
echo regex("ra.","raymond")
echo regex(".*at","chat")
echo regex(".*at","chats")