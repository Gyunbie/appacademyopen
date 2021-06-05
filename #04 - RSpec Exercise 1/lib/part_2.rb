def hipsterfy(str)
    vowels = "aeiou"
    arr = str.split("")
    (0...arr.length).reverse_each do |num|
        if vowels.include?(arr[num])
            arr.delete_at(num)
            break
        end
    end

    arr.join("")
end

def vowel_counts(str)
    vowels = "aeiou"
    hash = Hash.new(0)

    str.downcase.each_char do |char|
        if vowels.include?(char)
            hash[char] += 1
        end
    end

    return hash
end

def caesar_cipher(msg, num)
    alphabet = ("a".."z").to_a
    new_str = ""

    msg.each_char do |char|
        if alphabet.include?(char)
            old_index = alphabet.index(char)
            new_index = old_index + num
            new_str += alphabet[new_index % alphabet.length]
        else
            new_str += char
        end
    end
    new_str
end