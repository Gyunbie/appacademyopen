def element_count(arr)
  hash = Hash.new(0)

  arr.each { |ele| hash[ele] += 1 }
  hash
end
    
def char_replace!(str, hash)
  str.each_char.with_index do |c, idx|
    unless hash[c].nil?
      str[idx] = hash[c]
    end
  end
end

def product_inject(arr)
  arr.inject { |acc, i| acc * i }
end