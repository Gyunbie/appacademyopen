def proper_factors(num)
  arr = *(1...num)
  arr.select { |i| num % i == 0 }
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  sum = aliquot_sum(num)
  num == sum
end

def ideal_numbers(n)
  nums = []
  i = 1
  
  while nums.size < n
    nums << i if perfect_number?(i)
    i += 1
  end
  nums
end
