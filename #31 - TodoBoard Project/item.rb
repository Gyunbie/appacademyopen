class Item
  attr_accessor :title, :description
  attr_reader :deadline, :done

  def self.valid_date?(str)
    arr = str.split("-").map(&:to_i)
    y, m, d = arr
    return false if arr.size != 3 || !(1..12).include?(arr[1]) || !(1..31).include?(arr[2])
    true
  end

  def initialize(title, deadline, description)
    raise "Incorrect date." unless Item.valid_date?(deadline)
    @title = title    
    @deadline = deadline
    @description = description
    @done = false
  end

  def deadline=(deadline)
    raise "Incorrect date." unless Item.valid_date?(deadline)
    @deadline = deadline
  end

  def toggle
    @done = !@done
  end
end
