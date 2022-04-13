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

def fibonacci(n)
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2
    arr = fibonacci(n-1)
    arr << arr[-1] + arr[-2]
end

#p fibonacci(10)

def bsearch(arr, target)
    return nil if !arr.include?(target)
    mid_idx = arr.length / 2
    return mid_idx if arr[mid_idx] == target
    if arr[mid_idx] < target
        bsearch(arr[mid_idx+1..-1], target) + mid_idx + 1
    elsif arr[mid_idx] > target
        bsearch(arr[0...mid_idx], target)
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
    return arr if arr.length <= 1
    mid_idx = arr.length / 2
    first_half = arr[0...mid_idx]
    last_half = arr[mid_idx..-1]
    arr1 = merge_sort(first_half)
    arr2 = merge_sort(last_half)
    merge(arr1, arr2)
end

arr1 = [6]
arr2 = []
result = [1, 2, 3, 4, 5]

def merge(arr1, arr2)
    result = []
    until arr1.empty? || arr2.empty?
        if arr1[0] < arr2[0]
            result << arr1.shift
        else
            result << arr2.shift
        end
    end
    return result + arr1 + arr2
end

#p merge_sort([3,6,2,1,8,9])

