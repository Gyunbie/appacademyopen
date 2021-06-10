def duos(str)
  arr = str.split("")
  count = 0

  (0...arr.length-1).each do |i|
    count += 1 if arr[i] == arr[i+1]
  end
  count
end

def sentence_swap(sent, hash)
  arr = sent.split(" ")

  arr.map! do |word|
    if hash[word] != nil
      hash[word]
    else
      word
    end
  end
  arr.join(" ")
end

def hash_mapped(hash, prc, &prc_bl)
  new_hash = Hash.new()

  hash.each do |k, v|
    new_hash[prc_bl.call(k)] = prc.call(v)
  end
  new_hash
end

def counted_characters(str)
  chars = []
  len = str.length
  
  (0...len).each do |i|
    count = 0
    (0...len).each { |j| count += 1 if j > i && str[i] == str[j] }
    char = str[i]
    chars << char if count > 1 && ! chars.include?(char)
  end
  chars
end

def triplet_true(str)
  (0...str.length-2).each do |i|
    if str[i] == str[i+1] && str[i+1] == str[i+2]
      return true
    end
  end
  return false
end

def energetic_encoding(str, hash)
  arr = str.split("")

  arr.map! do |c|
    if c == ' '
      c   
    elsif hash[c].nil?
      '?'
    else
      hash[c]
    end
  end
  arr.join("")
end

def uncompress(str)
  new_str = ""
  (1...str.length).step(2).each do |i|
    (0...str[i].to_i).each do
      new_str += str[i - 1]
    end
  end
  new_str
end

def conjunct_select(arr, *procs)
  arr.select do |ele|
    ele if procs.all? { |prc| prc.call(ele) }
  end
end

def convert_pig_latin(sent)
  vowels = "aeiou"
  arr = sent.split(" ")

  arr.map! do |word|
    capitalized = (word[0].upcase == word[0])
    if word.length < 3
      word
    elsif vowels.include?(word[0])
      word + "yay"
    else
      new_word = []
      word.each_char.with_index do |c, i|
        unless vowels.include?(c)
          to_end = c
          new_word << to_end
        else
          new_word.unshift(*word[i...word.length])
          break
        end
      end
      new_word = new_word.join("") + "ay"
      capitalized ? new_word.capitalize : new_word
    end
  end
  arr.join(" ")
end

def reverberate(sent)
  vowels = "aeiou"
  arr = sent.split(" ")

  arr.map! do |word|
    capitalized = (word[0].upcase == word[0])
    if word.length < 3
      new_word = word
    elsif vowels.include?(word[word.length - 1])
      new_word = word + word
    else
      index = -1
      word.reverse.each_char.with_index do |c, i|
        if vowels.include?(c)
          index = word.length - (i + 1)
          break
        end
      end
      new_word = word + word[index...word.length]
    end
    capitalized ? new_word.capitalize : new_word
  end
  arr.join(" ")
end

def disjunct_select(arr, *procs)
  arr.select do |ele|
    ele if procs.any? { |prc| prc.call(ele) }
  end
end

def alternating_vowel(sent)
  vowels = "aeiou"
  arr = sent.split(" ")
  index = -1

  arr.map!.with_index do |word, i|
    capitalized = (word[0].upcase == word[0])
    word_arr = word.split("")
    index = 0
    if i % 2 == 0
      word_arr.each.with_index do |c, idx|
        if vowels.include?(c)
          index = idx
          break
        end
      end
    else
      word_arr.reverse.each.with_index do |c, idx|
        if vowels.include?(c)
          index = word_arr.length - (idx + 1)
          break
        end
      end
    end
    word_arr.delete_at(index)
    new_word = word_arr.join("")
    capitalized ? new_word.capitalize : new_word
  end

  arr.join(" ")
end

def silly_talk(sent)
  vowels = "aeiou"
  arr = sent.split(" ")

  arr.map! do |word|
    capitalized = (word[0].upcase == word[0])
    if vowels.include?(word[word.length - 1])
      new_word = word + word[word.length - 1]
    else
      word_arr = word.split("")
      new_arr = []

      word_arr.each do |c|
        if vowels.include?(c)
          new_arr << c
          new_arr << 'b'
          new_arr << c
        else
          new_arr << c
        end
      end
      new_word = new_arr.join("")
    end

    capitalized ? new_word.capitalize : new_word
  end
  arr.join(" ")
end

def compress(str)
  arr = str.split("")
  new_str = ""
  count = 1

  arr.each.with_index do |c, i|
    if c == arr[i + 1]
      count += 1
      next
    elsif count > 1
      new_str += c
      new_str += count.to_s
      count = 1
    else
      new_str += c
    end
  end
  new_str
end