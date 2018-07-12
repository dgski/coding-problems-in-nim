# Given the mapping a = 1, b = 2, ... z = 26, and an encoded message, count the number of ways it can be decoded.
# For example, the message '111' would give 3, since it could be decoded as 'aaa, 'ka', and 'ak'.

import strutils

proc numOfDecodes(input: string): int =
    echo repr input
    if input.len == 1: echo "returning 1"; return 1
    elif input.len == 2 and input[1] != '0' and parseInt(input) < 27: echo "returning 2"; return 2
    elif input.len == 2: echo "returning 1"; return 1 
    result = numOfDecodes(input[0..1]) + numOfDecodes(input[2..input.high])

    echo "returning...", result
    
var message = "1111"
    
echo numOfDecodes message
