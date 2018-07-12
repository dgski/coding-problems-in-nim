# The area of a circle is defined as πr^2. Estimate π to 3 decimal places using a Monte Carlo method.
import random

proc monteCarloCircle(iterations: int): float =
    var pointsCircle,pointsSquare: int

    for i in 1..iterations:
        var
            x = random(-1.0..1.0)
            y = random(-1.0..1.0)
        
        if (x*x) + (y*y) <= 1: inc pointsCircle
        inc pointsSquare

    return (pointsCircle/pointsSquare) * 4


echo monteCarloCircle(1000000000)