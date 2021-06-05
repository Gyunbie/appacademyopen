def no_dupes?(arr)
  arr.select { |ele| ele unless arr.count(ele) > 1 }
end

def no_consecutive_repeats?(arr)
  (0...arr.size-1).each do |i|
    return false if arr[i] == arr[i+1]
  end
  return true
end

def char_indices(str)
  hash = Hash.new { |h, k| h[k] = [] }

  str.each_char.with_index do |c, idx|
    hash[c] << idx
  end
  hash
end

def longest_streak(str)
  curr = ""
  longest = ""

  (0...str.size).each do |i|
    if str[i] == str[i-1] || i == 0
      curr += str[i]
    else
      curr = str[i]
    end
    
    if curr.size > longest.size
      longest = curr
    end
  end
  longest
end

def prime?(num)
  return false if num < 2
  (2...num).none? { |i| i if num % i == 0 }
end

def prime_factors(num)
  (2..num).select { |i| num % i == 0 && prime?(i) }
end

def bi_prime?(num)
  prime_factors = prime_factors(num)
  prime_factors.each do |a|
    b = num / a
    return true if prime_factors.include?(b)
  end
  return false
end

def vigenere_cipher(message, keys)
  alpha = ("a".."z").to_a
  new_message = ""
  message.each_char.with_index do |c, i|
    new_i = (alpha.index(c) + keys[i % keys.size]) % alpha.size
    new_message += alpha[new_i]
  end
  new_message
end

def vowel_rotate(str)
  vowels = "aeiou"
  new_str = ""
  tmp = ""
  str.each_char do |c|
    if vowels.include?(c)
      tmp = c
    end
  end

  str.each_char do |c|
    if vowels.include?(c)
      new_str += tmp
      tmp = c
    else
      new_str += c
    end
  end
  new_str
end

class String
  def select(&prc)
    return "" if prc.nil?
    new_str = ""

    self.each_char do |c|
      new_str += c if prc.call(c)
    end

    new_str
  end

  def map!(&prc)
    self.each_char.with_index do |c, i|
      self[i] = prc.call(c, i)
    end
    self
  end
end

# Examples
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"

def multiply(a, b)
  return 0 if b == 0

  if b < 0
    - (a + multiply(a, (-b) - 1))
  else
    a + multiply(a, b - 1)
  end
end

def lucas_sequence(size)
  return [] if size == 0
  return [2] if size == 1
  return [2, 1] if size == 2
  
  seq = lucas_sequence(size - 1)
  seq << seq[-1] + seq[-2]
  seq
end

def prime_factorization(num)
  (2..num).each do |i|
    if num % i == 0 && prime?(i)
      other_i = num / i
      return [i, *prime_factorization(other_i)]
    end
  end
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
