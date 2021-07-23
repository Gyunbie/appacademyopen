class Array
  def my_each(&prc)
    self.size.times do |i|
      prc.call(self[i])
    end

    self
  end

  def my_select(&prc)
    new_arr = []
    self.my_each { |ele| new_arr << ele if prc.call(ele) }
    new_arr
  end

  def my_reject(&prc)
    new_arr = []
    self.my_each { |ele| new_arr << ele unless prc.call(ele) }
    new_arr
  end

  def my_any?(&prc)
    self.my_each { |ele| return true if prc.call(ele) }
    false
  end

  def my_all?(&prc)
    self.my_each { |ele| return false unless prc.call(ele) }
    true
  end

  def my_flatten
    new_arr = []

    self.my_each do |ele|
      if ele.is_a?(Array)
        new_arr += ele.my_flatten
      else
        new_arr << ele
      end
    end

    new_arr
  end

  def my_zip(*args)
    new_arr = []
    self.size.times do |i|
      tmp_arr = [self[i]]

      args.my_each do |arr|
        tmp_arr << arr[i]
      end
      new_arr << tmp_arr
    end
    new_arr
  end

  def my_rotate(times = 1)
    idx = times % self.size

    self.drop(idx) + self.take(idx)
  end

  def my_join(separator = "")
    new_str = ""

    self.my_each do |ele|
      new_str += ele + separator
    end
    new_str
  end

  def my_reverse
    new_arr = []
    
    self.my_each do |ele|
      new_arr.unshift(ele)
    end
    
    new_arr
  end
end
