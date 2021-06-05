class Player
  def get_move
    print "enter a position with coordinates seperated with a space like `4 7`"
    input = gets.chomp
    arr = []
    tmp = input.split(" ")
    arr << tmp[0].to_i
    arr << tmp[1].to_i
    arr
  end
end
