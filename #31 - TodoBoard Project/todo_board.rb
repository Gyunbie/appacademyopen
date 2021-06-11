require_relative "list.rb"

class TodoBoard
  def initialize(label)
    @board = Hash.new
  end

  def get_command
    print("Enter a command > ")
    cmd, label, *args = gets.chomp.split(" ")
    case cmd
    when "mklist"
      @board[label] = List.new(label)
    when "ls"
      @board.each { |k, v| puts v.label }
    when "showall"
      @board.each { |k, v| v.print }
    when "mktodo"
      @board[label].add_item(*args)
    when "toggle"
      @board[label].toggle_item(args[0].to_i)
    when "rm"
      @board[label].remove_item(args[0].to_i)
    when "up"
      @board[label].up(*args.map(&:to_i))
    when "down"
      @board[label].down(*args.map(&:to_i))
    when "swap"
      @board[label].swap(*args.map(&:to_i))
    when "sort"
      @board[label].sort_by_date!
    when "purge"
      @board[label].purge
    when "priority"
      @board[label].print_priority
    when "print"
      if args.empty?
        @board[label].print
      else
        @board[label].print_full_item(args[0].to_i)
      end
    when "quit"
      return false
    else
      puts "You entered a wrong command."
    end
    true
  end

  def run
    while true
      return unless get_command
    end
  end
end

todo = TodoBoard.new("Groceries")
todo.run