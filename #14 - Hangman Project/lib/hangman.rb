class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman::random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char) ? true : false
  end

  def get_matching_indices(char)
    indices = []
    word = @secret_word.split("")
    word.each.with_index do |ele, index|
      indices << index if ele == char
    end

    indices
  end

  def fill_indices(char, indices)
    indices.each do |index|
      @guess_word[index] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char)
      puts("That has already attempted.")
      return false
    else
      @attempted_chars << char
      if get_matching_indices(char).empty?
        @remaining_incorrect_guesses -= 1
      else
        fill_indices(char, get_matching_indices(char))
      end
      return true
    end
  end

  def ask_user_for_guess
    puts("Enter a char > ")
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts("WIN")
      true
    else 
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts("LOSE")
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      puts(@secret_word)
      true
    else
      false
    end
  end
end
