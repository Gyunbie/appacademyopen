def all_words_capitalized?(arr)
    arr.all? { |word| word == word.capitalize }
end

def no_valid_url?(arr)
    endings = ['.com', '.net', '.io', '.org']

    arr.none? do |url|
        endings.any? { |ending| url.end_with?(ending) }
    end
end

def any_passing_students?(arr)
    arr.any? do |student| 
        grades = student[:grades]
        grades.sum / (grades.length * 1.0) >= 75
    end
end