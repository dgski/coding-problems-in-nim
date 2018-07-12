# Given a dictionary of words and a string made up of those words (no spaces), return the original sentence in a list. If there is more than one possible reconstruction, return any of them. If there is no possible reconstruction, then return null.
# For example, given the set of words 'quick', 'brown', 'the', 'fox', and the string "thequickbrownfox", you should return ['the', 'quick', 'brown', 'fox'].
# Given the set of words 'bed', 'bath', 'bedbath', 'and', 'beyond', and the string "bedbathandbeyond", return either ['bed', 'bath', 'and', 'beyond] or ['bedbath', 'and', 'beyond'].


proc seperatedSentance(words: seq[string], sentance: string): seq[string] =
    result =  @[]
    var wordStart = 0
    for i,j in sentance:
        if sentance[wordStart..i] in words:
            result.add(sentance[wordStart..i])
            wordStart = i + 1


var sampleWords_1 = @["quick","brown","the","fox"]
var sampleString_1 = "thequickbrownfox"

var sampleWords_2 = @["bed", "bath", "bedbath", "and", "beyond"]
var sampleString_2 = "bedbathandbeyond"

echo seperatedSentance(sampleWords_1, sampleString_1)
echo seperatedSentance(sampleWords_2, sampleString_2)

