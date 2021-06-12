def factors(num)
  factors_arr = []

  (1..num).each do |n|
    if num % n == 0
      factors_arr << n
    end
  end
  factors_arr
end


class Array
  def bubble_sort!(&prc)
    check = true

    (0...self.size - 1).each do |n|
      if prc.call(self[n], self[n + 1]) == 1
        self[n], self[n + 1] = self[n + 1], self[n]
        check = false
      end
    end

    bubble_sort!(&prc) if check == false
    self
  end

  def bubble_sort(&prc)
    dupe = self.dup
    dupe.bubble_sort!(&prc)
  end
end

# ### Substrings and Subwords
#
# Write a method, `substrings`, that will take a `String` and return an
# array containing each of its substrings. Don't repeat substrings.
# Example output: `substrings("cat") => ["c", "ca", "cat", "a", "at",
# "t"]`.
#
# Your `substrings` method returns many strings that are not true English
# words. Let's write a new method, `subwords`, which will call
# `substrings`, filtering it to return only valid words. To do this,
# `subwords` will accept both a string and a dictionary (an array of
# words).

def substrings(string)
  substr_arr = []
  (0...string.size).each do |i|
    (0...string.size).each do |j|
      substr_arr << string[i..j] if j >= i
    end
  end
  substr_arr
end

def subwords(word, dictionary)
  substr_arr = substrings(word)
  new_arr = []

  substr_arr.each do |ele|
    new_arr << ele if dictionary.include?(ele)
  end

  new_arr
end
