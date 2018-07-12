# Run-length encoding is a fast and simple method of encoding strings. The basic idea is to represent repeated successive characters as a single count and character. For example, the string "AAAABBBCCDAA" would be encoded as "4A3B2C1D2A".

# Implement run-length encoding and decoding. You can assume the string to be encoded have no digits and consists solely of alphabetic characters. You can assume the string to be decoded is valid.

import strutils

proc encode(input: string): string =
    result = ""

    var i, inst: int
    var letter: char

    while i < input.len:
        if i == 0:
            letter = input[i]
            inc inst
        elif letter != input[i]:
            result = result & $inst & letter
            inst = 1
            letter = input[i]
        else:
            inc inst
        inc i

    result = result & $inst & letter

proc decode(input: string): string =
    
    if input.len mod 2 != 0:
        return ""
    
    result = ""

    var
        inst = 0
        letter = 1
    while letter < input.len:

        for i in 1..(int(input[inst]) - int('0')):
            result.add(input[letter])
        inc(inst,2)
        inc(letter,2)





var sample = "AAAABBBCCDAA"

echo sample
sample = sample.encode
echo sample.decode
