# Given an integer k and a string s, find the length of the longest substring that contains at most k distinct characters.

# For example, given s = "abcba" and k = 2, the longest substring with k distinct characters is "bcb".
import strutils

proc distinctChars(s: string, k: int): string =
    result = ""
    for i,j in s:
        var tempS = $j
        var uniques = 1
        for x in (i+1)..s.high:
            if not (s[x] in tempS):
                inc uniques
            if uniques > k:
                if result.len < tempS.len:
                    result = tempS
                break
            else:
                tempS.add(s[x])

echo distinctChars("abcbca", 2)