def range(start, finish)
    return [] if finish < start
    return [1] if finish <= 2
    arr = range(start, finish-1)
    arr << arr[-1] + 1
end

# p range(1,5)

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

# p exp(2, 4)
# p exp(3, 3)

class Array
    def deep_dup
        return self.dup if self.length == 1

        duped = []
        self.each do |subarray|
            if subarray.is_a?(Array)
                duped << subarray.deep_dup
            else
                duped << subarray
            end
        end
        duped
    end
end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.deep_dup

# # shouldn't modify robot_parts
# p robot_parts_copy[1] << "LEDs"
# # but it does
# p robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
