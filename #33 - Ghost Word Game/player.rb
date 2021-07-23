class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def alert_invalid
    puts "You entered an invalid guess. Please enter again."
  end

  def guess
    print "Player ##{@name}, please enter a character > "
    input = gets.chomp
  end
end
