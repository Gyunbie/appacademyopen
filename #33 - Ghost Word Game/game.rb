require_relative "player.rb"
require "set"

class Game
  def initialize(*player_args)
    @players = Array.new
    player_args.each { |p| @players << Player.new(p) }
    @current_player = @players[0]
    @fragment = ''
    @dictionary = read_file
    @losses = Hash.new("")
  end

  def read_file
    file_data = File.read("assets/dictionary.txt").split
    set = file_data.to_set
    set
  end

  def valid_play?(play)
    return false unless ("a".."z").include?(play)

    word = @fragment + play

    @dictionary.each do |ele|
      if ele.include?(word)
        return true
      end
    end

    false
  end

  def round_lost?
    if @dictionary.include?(@fragment)
      return true
    end
    false
  end

  def game_lost?
    return true if @losses[@current_player] == "GHOST"
  end

  def switch_player
    @players.rotate!
    @current_player = @players[0]
  end

  def take_turn(player)
    puts "Current word fragment is: #{@fragment}"
    play = player.guess

    unless valid_play?(play)
      @current_player.alert_invalid 
      take_turn(player)
    else
      @fragment += play

      if round_lost?
        @losses[@current_player] += "GHOST"[@losses[@current_player].size]
        puts "Player ##{@current_player.name} lost this round. The word is '#{@fragment}'."
        puts "Player ##{@current_player.name} is now #{@losses[@current_player]}."
        @fragment = ""
      end

      if game_lost?
        puts "Player ##{@current_player.name} has eliminated!"
        @players.delete_at(@players.index(@current_player))

        if @players.length == 1
          puts "Player ##{@players[0].name} has won the game!"
          exit
        end
      end
    end
  end

  def play_round
    while true
      take_turn(@current_player)
      switch_player
    end  
  end
end

game = Game.new("a", "b", "c", "d")
game.play_round
