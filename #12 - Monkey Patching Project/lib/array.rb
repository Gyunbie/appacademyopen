# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.empty?
      return nil
    elsif self.all? { |ele| ele.is_a? Numeric }
      return (self.max - self.min)
    end
  end

  def average
    self.empty? ? nil : self.sum.to_f / self.length
  end

  def median
    if self.empty?
      nil
    elsif self.length % 2 == 1
      self.sort[self.length / 2]
    elsif self.length % 2 == 0
      (self.sort[self.length / 2 - 1] + self.sort[self.length / 2]) / 2.0
    end
  end

  def counts
    counts = Hash.new(0)
    self.each { |ele| counts[ele] += 1 }
    counts
  end

  def my_count(val)
    count = 0
    self.each { |ele| count += 1 if ele == val }
    count
  end

  def my_index(val)
    self.each.with_index { |ele, index| return index if val == ele }
    return nil
  end

  def my_uniq
    new_arr = []
    self.each { |ele| new_arr << ele unless new_arr.include?(ele) }
    new_arr
  end
  
  def my_transpose
    new_arr = []
    
    (0...self.length).each do |row|
      new_row = []
      (0...self.length).each do |col|
        new_row << self[col][row]
      end
      new_arr << new_row
    end      
    new_arr
  end
end
