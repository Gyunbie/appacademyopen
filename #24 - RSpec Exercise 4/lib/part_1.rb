def my_reject(arr, &prc)
  new_arr = []
  
  arr.each do |ele|
    unless prc.call(ele)
      new_arr << ele
    end
  end
  new_arr
end

def my_one?(arr, &prc)
  trues = 0
  arr.each do |ele|
    trues += 1 if prc.call(ele)
  end

  trues == 1
end

def hash_select(hash, &prc)
  new_hash = {}
  hash.each do |k, v|
    new_hash[k] = v if prc.call(k, v)
  end
  new_hash
end

def xor_select(arr, prc1, prc2)
  arr.select do |ele|
    (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))
  end
end

def proc_count(val, arr)
  count = 0
  arr.each do |prc|
    count += 1 if prc.call(val)
  end
  count
end