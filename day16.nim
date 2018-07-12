# You run an e-commerce website and want to record the last N order ids in a log. Implement a data structure to accomplish this, with the following API:

# - record(order_id): adds the order_id to the log
# - get_last(i): gets the ith last element from the log. i is guaranteed to be smaller than or equal to N.
# You should be as efficient with time and space as possible.

type
    Log[S:static[int],T] = object
        data: array[S,T]
        len: int



proc record[S,T](ourLog: var Log[S,T], order_id: T):int =
    if ourLog.len == ourLog.data.len: return -1
    ourLog.data[ourLog.len] = order_id
    result = ourLog.len
    inc ourLog.len

proc get_last[S,T](ourLog: Log[S,T], i: int): (bool,T) =
    if (ourLog.len - 1 - i)  < 0: return (false,0)
    return (true,ourLog.data[(ourLog.len - 1) - i])


var newLog: Log[10,int]

for i in 1..11:
    echo "Added at index:", newLog.record(i)

for i in 1..11:
    var res = newLog.get_last(i)
    if res[0] == true:
        echo "Last value is:", res[1]
    else:
        echo "Nothing exists there."
