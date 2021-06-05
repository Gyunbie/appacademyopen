def partition(arr, num)
    arr1 = []
    arr2 = []

    arr.each do |ele|
        if ele < num
            arr1.push(ele)
        else
            arr2.push(ele)
        end
    end
    [arr1, arr2]
end

def merge(hash1, hash2)
    new_hash = Hash.new()

    hash1.each {|k,v| new_hash[k] = v}
    hash2.each {|k,v| new_hash[k] = v}

    new_hash
end

def censor(str, curses)
    vowels = "aeiouAEIOU"
    arr = str.split(" ")
    (0...arr.length).each do |num|
        if curses.include?(arr[num].upcase) || curses.include?(arr[num].downcase)
            (0...arr[num].length).each do |i|
                arr[num][i] = "*" if vowels.include?(arr[num][i])
            end
        end
    end
    arr.join(" ")
end

def power_of_two?(num)
    product = 1

    while product < num
        product *= 2
    end

    product == num
end