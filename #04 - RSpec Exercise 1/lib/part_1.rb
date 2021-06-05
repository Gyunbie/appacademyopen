def average(num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    arr.inject {|acc, val| acc + val}.to_f / arr.length
end

def repeat(str, times)
    return str * times
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    words = str.split(" ")

    new_arr = words.map.with_index do |word, i|
        if i % 2 == 0
            word.upcase
        else
            word.downcase
        end
    end

    new_arr.join(" ")
end