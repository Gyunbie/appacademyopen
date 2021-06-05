# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def prime?(num)
    return false if num < 2

    (2...num).none? { |i| num % i == 0 }
end

def largest_prime_factor(num)
    num.downto(2) do |factor|
        if num % factor == 0 && prime?(factor)
            return factor
        end
    end
end

def unique_chars?(str)
    seen = Hash.new(0)

    str.each_char do |char|
        seen[char] += 1
    end

    seen.each do |key, value|
        if value > 1
            return false
        end
    end
    return true
end

def dupe_indices(arr)
    dupe = Hash.new {|h,k| h[k]=[]}

    (0...arr.length).each do |index|
        dupe[arr[index]].push(index)
    end

    dupe.each do |key, value|
        dupe.delete(key) if value.length < 2
    end

    dupe
end

def hash_count(arr)
    count = Hash.new(0)

    arr.each { |ele| count[ele] += 1 }

    count
end

def ana_array(arr1, arr2)
    arr1c = hash_count(arr1)
    arr2c = hash_count(arr2)
    arr1c == arr2c
end