# The edit distance between two strings refers to the minimum number of character insertions, deletions, and substitutions required to change one string to the other. For example, the edit distance between “kitten” and “sitting” is three: substitute the “k” for “s”, substitute the “e” for “i”, and append a “g”.

# Given two strings, compute the edit distance between them.


# operations to convert str1 to str2
proc editDistance(str1, str2: string, m , n: int): int =
    # If first string is empty, the only option is to
    # insert all characters of second string into first
    if m==0:
         return n
 
    # If second string is empty, the only option is to
    # remove all characters of first string
    if n==0:
        return m
 
    # If last characters of two strings are same, nothing
    # much to do. Ignore last characters and get count for
    # remaining strings.
    if str1[m-1]==str2[n-1]:
        return editDistance(str1,str2,m-1,n-1)
 
    # If last characters are not same, consider all three
    # operations on last character of first string, recursively
    # compute minimum cost for all three operations and take
    # minimum of three values.
    return 1 + min(min(editDistance(str1, str2, m, n-1),    # Insert
                   editDistance(str1, str2, m-1, n)),    # Remove
                   editDistance(str1, str2, m-1, n-1)    # Replace
                   )


var sample1 = "kitten"
var sample2 = "sitting"

echo editDistance(sample1,sample2, sample1.len, sample2.len)