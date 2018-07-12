# Suppose you are given a table of currency exchange rates, represented as a 2D array. Determine whether there is a possible arbitrage: that is, whether there is some sequence of trades you can make, starting with some amount A of any currency, so that you can end up with some amount greater than A of that currency.

# There are no transaction costs and you can trade fractional quantities.
import math


proc arbitrage[S,T](ourTable: array[S,T]): bool =

    var transformed_graph: array[S,T]


    for i, row in ourTable:
        for j, edge in row:
            transformed_graph[i][j] = log10(edge)
    
    var source = 0
    var n = transformed_graph.len
    var min_dist: T

    min_dist[source] = 0

    echo repr transformed_graph

    for i in 0..(n - 1)-1:
        for v in 0..(n)-1:
            for w in 0..(n)-1:
                if min_dist[w] > min_dist[v] + transformed_graph[v][w]:
                    min_dist[w] = min_dist[v] + transformed_graph[v][w]

    # If we can still relax edges, then we have a negative cycle
    for v in 0..(n)-1:
        for w in 0..(n)-1:
            if min_dist[w] > min_dist[v] + transformed_graph[v][w]:
                return true

    return false



            # USD CAD
var sample1 = [
#[CAD]#    [0.9,1.0],
#[USD]#    [1.0,1.2]
]

echo sample1.arbitrage
