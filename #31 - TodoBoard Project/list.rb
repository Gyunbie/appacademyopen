require_relative "item.rb"

class List
  SEPARATOR = "-" * 44
  CHECKMARK = "\u2713".force_encoding('utf-8')

  def initialize(label)
    @label = label
    @items = []
  end

  attr_accessor :label

  def add_item(title, deadline, description = "")
    return false unless Item.valid_date?(deadline)
    @items << Item.new(title, deadline, description)
    true
  end

  def size
    return @items.size
  end

  def valid_index?(index)
    (0...@items.size).include?(index)
  end

  def swap(index_1, index_2)
    return false unless valid_index?(index_1) || valid_index?(index_2)
    @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
    true
  end

  def [](index)
    return nil unless valid_index?(index)
    @items[index]
  end

  def priority
    @items[0]
  end

  def print
    puts SEPARATOR
    puts @label.upcase
    puts SEPARATOR
    puts "#{"Index".ljust(6)} | #{"Item".ljust(15)} | #{"Deadline".ljust(10)}"

    @items.each.with_index do |item, idx|
      is_done = item.done ? CHECKMARK : " "
      puts "#{idx.to_s.ljust(6)} | #{item.title.ljust(15)} | #{item.deadline.ljust(10)} | [#{is_done}]"
    end
  end

  def print_full_item(index)
    if valid_index?(index)
      item = @items[index]
      is_done = item.done ? CHECKMARK : " "
      puts SEPARATOR
      puts "#{item.title.ljust(20)} #{item.deadline} [#{is_done}]"
      puts "#{item.description}"
    end
  end

  def print_priority
    print_full_item(0)
  end

  def up(index, amt = 1)
    return false unless valid_index?(index)

    while amt != 0 && idx > 0
      idx -= 1
      amt -= 1
      @items[idx], @items[idx + 1] = @items[idx + 1], @items[idx]
    end
    true
  end

  def down(index, amt = 1)
    return false unless valid_index?(index)

    while amt != 0 && idx < @items.size - 1
      idx += 1
      amt -= 1
      @items[idx], @items[idx - 1] = @items[idx - 1], @items[idx]
    end
    true
  end

  def sort_by_date!
    @items.sort_by! { |item| item.deadline }
  end

  def toggle_item(index)
    @items[index].toggle
  end

  def remove_item(index)
    return false unless valid_index?(index)

    @items.delete_at(index)
    true
  end

  def purge
    @items.delete_if(&:done)
  end
end