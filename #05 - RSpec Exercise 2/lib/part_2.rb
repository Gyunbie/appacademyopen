def palindrome?(str)
    str.each_char.with_index do |char, i|
        if str[i] != str[-i - 1]
            return false
        end
    end
    true
end

def substrings(str)
    subs = []
    (0...str.length).each do |start_index|
        (start_index...str.length).each do |end_index|
            subs << str[start_index..end_index]
        end
    end
    subs
end

def palindrome_substrings(str)
    new_arr = []

    subs = substrings(str)
    subs.each {|ele| new_arr << ele if (ele.length > 1 && palindrome?(ele))}

    new_arr
end