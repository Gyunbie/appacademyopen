def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject { |dog| dog["age"] <= 2}
end

def count_positive_subarrays(arr)
    arr.count { |subarr| subarr.sum > 0 }
end

def aba_translate(str)
    vowels = "aeiouAEIOU"
    new_word = ""

    str.each_char do |char|
        if vowels.include?(char)
            new_word += char + "b" + char
        else
            new_word += char
        end
    end

    new_word
end

def aba_array(arr)
    new_arr = arr.map{ |word| aba_translate(word) }
end
