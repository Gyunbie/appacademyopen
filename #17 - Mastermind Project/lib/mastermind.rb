require_relative "code"

class Mastermind
  def initialize(len)
    @secret_code = Code.random(len)
  end

  def print_matches(inst)
    puts(@secret_code.num_exact_matches(inst))
    puts(@secret_code.num_near_matches(inst))
  end

  def ask_user_for_guess
    puts("Enter a code")
    code = gets.chomp
    inst = Code.from_string(code)

    puts(@secret_code.num_exact_matches(inst))
    puts(@secret_code.num_near_matches(inst))

    inst == @secret_code
  end
end
