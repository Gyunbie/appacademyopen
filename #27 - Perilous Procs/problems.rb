def some?(arr, &prc)
  arr.any? { |ele| prc.call(ele) }
end

def exactly?(arr, n, &prc)
  count = 0
  arr.each do |ele|
    count += 1 if prc.call(ele)
  end
  count == n
end

def filter_out(arr, &prc)
  new_arr = []
  arr.each do |ele|
    new_arr << ele unless prc.call(ele)
  end
  new_arr
end

def at_least?(arr, n, &prc)
  count = 0
  arr.each do |ele|
    count += 1 if prc.call(ele)
  end
  count >= n
end

def every?(arr, &prc)
  arr.each { |ele| return false unless prc.call(ele) }
  return true
end

def at_most?(arr, n, &prc)
  count = 0
  arr.each do |ele|
    count += 1 if prc.call(ele)
  end
  count <= n
end

def first_index(arr, &prc)
  arr.each.with_index do |ele, i|
    return i if prc.call(ele)
  end
  return nil
end

def xnor_select(arr, prc1, prc2)
  new_arr = []

  arr.each do |ele|
    new_arr << ele if (prc1.call(ele) && prc2.call(ele)) || (!prc1.call(ele) && !prc2.call(ele))
  end
  new_arr
end

def filter_out!(arr, &prc)
  arr.reject! { |ele| prc.call(ele) }
end

def multi_map(arr, n = 1, &prc)
  new_arr = []
  arr.each do |ele|
    (1..n).each { |i| ele = prc.call(ele) }
    new_arr << ele
  end
  new_arr
end

def proctition(arr, &prc)
  arr_true = []
  arr_false = []

  arr.each do |ele|
    if prc.call(ele)
      arr_true << ele
    else
      arr_false << ele
    end
  end
  arr_true += arr_false
  arr_true
end

def selected_map!(arr, prc1, prc2)
  arr.map! do |ele|
    if prc1.call(ele)
      prc2.call(ele)
    else
      ele
    end
  end
  return nil
end

def chain_map(val, procs)
  procs.each do |prc|
    val = prc.call(val)
  end
  val
end

def proc_suffix(sent, hash)
  words = sent.split(" ")
  new_arr = []
  
  words.each.with_index do |word, i|
    tmp = word.clone
    hash.each do |k, v|
      if k.call(word)
        tmp += v
      end
      new_arr[i] = tmp
    end
  end
  new_arr.join(" ")
end

def proctition_platinum(arr, *procs)
  hash = Hash.new()
  i = 1
  done_words = []
  
  procs.each do |prc|
    new_arr = []
    arr.each do |ele|
      if prc.call(ele) && ! done_words.include?(ele)
        new_arr << ele
        done_words << ele
      end
    end

    hash[i] = new_arr
    i += 1
  end
  hash
end

def procipher(sent, hash)
  words = sent.split(" ")
  new_arr = []
  words.each.with_index do |word, i|
    tmp = word.clone
    hash.each do |k, v|
      if k.call(word)
        tmp = v.call(tmp)
      end
    end
    new_arr[i] = tmp
  end
  new_arr.join(" ")
end

def picky_procipher(sent, hash)
  words = sent.split(" ")
  new_arr = []
  words.each.with_index do |word, i|
    tmp = word.clone
    hash.each do |k, v|
      if k.call(word)
        tmp = v.call(tmp)
        break
      end
    end
    new_arr[i] = tmp
  end
  new_arr.join(" ")
end