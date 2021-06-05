def zip(*arrays)
  len = arrays.first.length

  (0...len).map do |i|
    arrays.map { |array| array[i] }
  end
end

def prizz_proc(arr, prc1, prc2)
  new_arr = []
  arr.each do |ele|
    if (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))
      new_arr << ele
    end
  end
  new_arr
end

def zany_zip(*arrays)
  len = 0
  arrays.each { |arr| len = arr.length if arr.length > len }

  (0...len).map do |i|
    arrays.map { |array| array[i] }
  end
end

def maximum(arr, &prc)
  return nil if arr.empty?
  res = 0
  tmp = 0

  arr.each do |ele|
    proc_call = prc.call(ele)
    if proc_call >= res
      res = proc_call 
      tmp = ele
    end
  end
  tmp
end

def my_group_by(arr, &prc)
  hash = Hash.new { |h, k| h[k] = Array.new }

  arr.each do |ele|
    hash[prc.call(ele)] << ele
  end
  hash
end

def max_tie_breaker(arr, prc, &prc_bl)
  return nil if arr.empty?
  max = arr.first
  
  arr.each do |ele|
    res_el = prc_bl.call(ele)
    res_max = prc_bl.call(max)

    if res_el > res_max
      max = ele
    elsif res_el == res_max && prc.call(ele) > prc.call(max)
      max = ele
    end
  end
  max
end

def silly_syllables(sent)
  vowels = "aeiou"
  words = sent.split(" ")
  new_words = []
  words.each do |word|
    start_i = -1
    end_i = -1
    word.each_char.with_index do |c, i|
      if vowels.include?(c)
        start_i = i
        break
      end
    end

    word.reverse.each_char.with_index do |c, i|
      if vowels.include?(c)
        end_i = i
        break
      end
    end

    end_i = word.size - end_i - 1

    if start_i == end_i || start_i == -1
      new_words << word
      next
    end

    new_words << word[start_i..end_i]
  end
  new_words.join(" ")
end

silly_syllables("kabcdefghimv")