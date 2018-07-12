#cons(a, b) constructs a pair, and car(pair) and cdr(pair) returns the first and last element of that pair. 
#For example, car(cons(3, 4)) returns 3, and cdr(cons(3, 4)) returns 4.
#Given this implementation of cons:
# def cons(a, b):
#     return lambda f : f(a, b)
# Implement car and cdr.

proc cons[T](a,b: T): proc (f: proc(x,y: T):(T,T)):(T,T) =
    return proc (f: proc(x,y: T):(T,T)):(T,T) = return f(a,b)

proc car[T](ff: proc (f: proc(x,y: T):(T,T)):(T,T)): T =
    ff(proc(a,b:T):(T,T) = return (a,b))[0]

proc cdr[T](ff: proc (f: proc(x,y: T):(T,T)):(T,T)): T =
    ff(proc(a,b:T):(T,T) = return (a,b))[1]

echo repr cons(3,4)
echo car(cons(3,4))
echo cdr(cons(3,4))

    
    
