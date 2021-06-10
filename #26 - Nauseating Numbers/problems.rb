def strange_sums(arr)
  count = 0
  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      if arr[i] + arr[j] == 0 && j > i
        count += 1
      end
    end
  end
  count
end

def pair_product(arr, product)
  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      if arr[i] * arr[j] == product && j > i
        return true
      end
    end
  end
  return false
end

def rampant_repeats(str, hash)
  new_str = ''
  
  str.each_char do |c|
    unless hash[c].nil?
      (0...hash[c]).each { new_str += c }
    else
      new_str += c
    end
  end
  new_str
end

def perfect_square(num)
  (1..num).each do |i|
    return true if i * i == num
  end
  return false
end

def divisor_count(num)
  div_count = 0
  (1..num).each do |i|
    div_count += 1 if num % i == 0
  end
  div_count
end

def anti_prime?(num)
  div_count = divisor_count(num)

  (0...num).each do |i|
    if divisor_count(i) > div_count
      return false
    end
  end
  return true
end

def matrix_addition(matrix1, matrix2)
  new_arr = []
  (0...matrix1.length).each do |row|
    tmp_arr = []
    (0...matrix1[0].length).each do |col|
      tmp_arr << matrix1[row][col] + matrix2[row][col]
    end
    new_arr << tmp_arr
  end
  new_arr
end

def mutual_factors(*nums)
  hash = Hash.new(0)
  arr = []

  nums.each do |num|
    (1..num).each do |i|
      hash[i] += 1 if num % i == 0
    end
  end

  count = hash[1]

  hash.each do |k, v|
    arr << k if v == count
  end
  arr
end

def tribonacci_number(n)
  if n == 1
    return 1
  elsif n == 2
    return 1
  elsif n == 3
    return 2
  else
    tribonacci_number(n-1) + tribonacci_number(n-2) + tribonacci_number(n-3)
  end
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

def matrix_addition_reloaded(*matrixes)
  return nil unless matrixes.all? { |matrix| matrix.length == matrixes[0].length }
  tmp = matrixes[0].clone
  (0...matrixes.length-1).each do |num|
    tmp = matrix_addition(tmp, matrixes[num+1])
  end
  tmp
end

def row?(arr)
  arr.any? do |row|
    row.all?(row[0])
  end
end

def col?(arr)
  (0...arr.length).any? do |col|
    (0...arr.length).all? { |row| arr[row][col] == arr[0][col] }
  end
end

def squarocol?(arr)
  row?(arr) || col?(arr)
end

def squaragonal?(arr)
  l_to_r = (0...arr.length).all? { |i| arr[i][i] == arr[0][0] }
  r_to_l = (0...arr.length).all? { |i| arr[0+i][arr.length-(i+1)] == arr[arr.length-1][0] }

  l_to_r || r_to_l
end

def adj_sums(arr)
  sums = []

  (0...arr.length-1).each do |i|
    sums << arr[i] + arr[i+1]
  end
  sums
end

def pascals_triangle(n)
  triangle = [[1]]

  while triangle.length < n
    other = triangle.last
    next_level = [1]
    next_level += adj_sums(other)
    next_level << 1
    triangle << next_level
  end
  triangle
end

def is_prime?(num)
  return false if num < 2
  (2...num).none? { |i| num % i == 0 }
end

def mersenne_prime(n)
  count = 0
  x = 0

  while count < n
    candidate = 2 ** x - 1
    count += 1 if is_prime?(candidate)
    x += 1
  end

  candidate
end

def encode(word)
  alphabet = *("a".."z")
  sum = 0

  word.each_char { |c| sum += alphabet.index(c) + 1 }
  sum
end

def triangular_word?(word)
  encode = encode(word)
  count = 0
  triangular = 0

  while triangular < encode
    count += 1
    triangular = count * (count + 1) / 2
  end
  triangular == encode
end

def consecutive_collapse(arr)
  check = false
  (0...arr.length - 1).each do |i|
    if arr[i] == arr[i+1] + 1 || arr[i] == arr[i+1] - 1
      arr.delete_at(i)
      arr.delete_at(i)
      check = true
      break
    end
  end
  check ? consecutive_collapse(arr) : arr
end

def next_prime(num, n)
  count = 0
  step = 1

  if n < 0
    step = -step
    n = -n
  end

  while count < n
    return nil if num < 0
    num += step
    count += 1 if is_prime?(num)
  end

  num
end

def pretentious_primes(arr, n)
  arr.map do |num|
    next_prime(num, n)
  end
end
