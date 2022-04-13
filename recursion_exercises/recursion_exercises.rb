def range(start, finish)
    return [] if finish < start
    return [1] if finish <= 2
    arr = range(start, finish-1)
    arr << arr[-1] + 1
end

p range(1,5)

#def exp(b, n)
#    return 1 if n == 0
#    return b if n == 1
#    b * exp(b, n-1)
#end

def exp(b, n)
    return 1 if n == 0
    return b if n == 1
    if n.even?
        exp(b, n/2) * exp(b, n/2)
    else
        odd = exp(b, (n-1)/2)
        b * odd * odd
    end
end

p exp(2, 4)
p exp(3, 3)

