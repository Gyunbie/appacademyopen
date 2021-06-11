def duos(str)
  count = 0
  (0...str.length-1).each do |i|
    count += 1 if str[i] == str[i + 1]
  end
  count
end

puts "duos()"
p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0
puts


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

puts "sentence_swap()"
p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'
puts


def hash_mapped(hash, prc, &prc_bl)
  new_hash = Hash.new()

  hash.each do |k, v|
    new_hash[prc_bl.call(k)] = prc.call(v)
  end
  new_hash
end

puts "hash_mapped()"
double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}


def counted_characters(str)
  count = Hash.new(0)
  str.each_char { |c| count[c] += 1 }
  count.select { |c, n| n > 2 }.keys
end

puts "counted_characters()"
p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []
puts


def triplet_true?(str)
  (0...str.length-2).each do |i|
    if str[i..i+2] == str[i] * 3
      return true
    end
  end
  false
end

puts "tripled_true?()"
p triplet_true?('caaabb')        # true
p triplet_true?('terrrrrible')   # true
p triplet_true?('runninggg')     # true
p triplet_true?('bootcamp')      # false
p triplet_true?('e')             # false
puts


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

puts "energetic_encoding()"
p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'
puts


def uncompress(str)
  new_str = ""
  (1...str.length).step(2).each do |i|
    (0...str[i].to_i).each do
      new_str += str[i - 1]
    end
  end
  new_str
end

puts "uncompress()"
p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'
puts


def conjunct_select(arr, *procs)
  arr.select { |ele| procs.all? { |prc| prc.call(ele) } }
end

puts "conjunct_select()"
is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]
puts


def convert_pig_latin(sent)
  words = sent.split(" ")
  words.map! do |word|
    new_word = word.length > 2 ? convert_word(word) : word
    word == word.capitalize ? new_word.capitalize : new_word
  end
  words.join(" ")
end

def convert_word(word)
  vowels = "aeiouAEIOU"

  return word + 'yay' if vowels.include?(word[0])
  word.each_char.with_index do |c, i|
    if vowels.include?(c)
      return word[i..-1] + word[0...i] + 'ay'
    end
  end
end

puts "convert_pig_latin()"
p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"
puts


def reverberate(sent)
  vowels = "aeiou"
  arr = sent.split(" ")
  arr.map! do |word|
    new_word = word.length > 2 ? translate_word(word) : word
    word == word.capitalize ? new_word.capitalize : new_word
  end
  arr.join(" ")
end

def translate_word(word)
  vowels = "aeiouAEIOU"
  return word + word if vowels.include?(word[-1])

  i = word.length - 1
  while i >= 0
    if vowels.include?(word[i])
      return word + word[i..-1]
    end
    i -= 1
  end
end

puts "reverberate()"
p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"
puts


def disjunct_select(arr, *procs)
  arr.select { |ele| procs.any? { |prc| prc.call(ele) } }
end

puts "disjunct_select()"
longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }
p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]
p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]
p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]
puts


def alternating_vowel(sent)
  arr = sent.split(" ")
  arr.map!.with_index do |word, i|
    i.even? ? remove_first_vow(word) : remove_last_vow(word)
  end
  arr.join(" ")
end

def remove_first_vow(word)
  vowels = "aeiouAEIOU"
  word.each_char.with_index do |c, i|
    if vowels.include?(c)
      return word[0...i] + word[i + 1..-1]
    end
  end
  word
end

def remove_last_vow(word)
  remove_first_vow(word.reverse).reverse
end

puts "alternating_vowel()"
p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"
puts


def silly_talk(sent)
  arr = sent.split(" ")
  arr.map! do |word|
    new_word = transcribe_word(word)
    word == word.capitalize ? new_word.capitalize : new_word
  end
  arr.join(" ")
end

def transcribe_word(word)
  vowels = "aeiouAEIOU"
  return word + word[-1] if vowels.include?(word[-1])

  new_word = ''
  word.each_char do |c|
    if vowels.include?(c)
      new_word += c + 'b' + c
    else
      new_word += c
    end
  end
  new_word
end

puts "silly_talk()"
p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"
puts


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

puts "compress()"
p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"
puts
