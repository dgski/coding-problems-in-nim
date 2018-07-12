#Given a stream of elements too large to store in memory, pick a random element from the stream with uniform probability.
import random, times

proc getUniformRandom(value,randomSample: int, count: var int): int =
    inc count
    if count == 1: return value

    var gen = random(count)
    if gen == count - 1: return value

    return randomSample





var testArray = [1,2,3,4]
var count = 0
var randomSample: int

for i,j in testArray:
    randomize(int(epochTime()))
    randomSample = getUniformRandom(j,randomSample,count)
    echo "Random number at index ", i," : ",randomSample




