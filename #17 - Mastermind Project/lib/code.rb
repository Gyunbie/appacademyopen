class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def initialize(chars)
    unless Code.valid_pegs?(chars)
      raise "Pegs are not valid."
    else
      @pegs = chars
      @pegs = chars.map { |ele| ele.upcase }
    end
  end

  def self.valid_pegs?(chars)
    chars.each { |ele| return false unless POSSIBLE_PEGS.include?(ele.upcase) }
    return true
  end

  def self.random(len)
    rand_arr = []
    len.times { |num| rand_arr << POSSIBLE_PEGS.keys.sample }
    inst = Code.new(rand_arr)
  end

  def self.from_string(str)
    new_arr = str.split("")
    inst = Code.new(new_arr)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.size
  end

  def num_exact_matches(inst)
    count = 0
    (0...inst.pegs.size).each do |num|
      count += 1 if @pegs[num] == inst.pegs[num]
    end
    count
  end

  def num_near_matches(inst)
    count = 0
    (0...inst.length).each do |num|
      if inst[num] != self[num] && self.pegs.include?(inst[num])
        count += 1 
      end
    end
    count
  end

  def ==(inst)
    self.pegs == inst.pegs
  end
end
