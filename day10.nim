# Implement a job scheduler which takes in a function f and an integer n, and calls f after n milliseconds.

import times, os, system, locks, threadpool

#Timer
type
    Timer[T] = object
        expiration: float
        function: proc(input:T = nil)
        argument: T

#Channel
type
    TimerChannel = Channel[Timer[string]]
var
    channel: TimerChannel
    thread: Thread[ptr TimerChannel]


#Schedule Procedure
proc schedule [T](channel: var TimerChannel, f: proc(input:T = nil), delay: float, input: T)=
    var newTimer = Timer[T](expiration: epochTime() + delay/1000, function: f, argument: input )
    channel.send(newTimer)


proc service [T](inTimers: var seq[Timer[T]]): bool {.discardable.} =
    for i,j in inTimers.mpairs:
        if j.expiration <= epochTime():
            j.function(j.argument)
            inTimers.del(i)   
    if inTimers.len == 0: return false
    return true

#Sample Procedure
proc speak(input: string) =
    echo "Spoken: " & input

#Proccessor
proc processing(channel: ptr TimerChannel) {.thread.} =
    var timers = newSeq[Timer[string]]()
    while true:
        var newTimer = channel[].tryRecv()
        if newTimer[0]: timers.add(newTimer[1])
        timers.service()
        os.sleep(1000)

channel.open()
createThread(thread,processing,addr(channel))

#Add Samples
channel.schedule(speak, 1000, "Hello")
channel.schedule(speak, 2000, "Hello, again!")
channel.schedule(speak, 3000, "YOLO!")
channel.schedule(speak, 10000, "Last time!")


joinThreads(thread)
