require_relative "room"

class Hotel
  def initialize(name, caps)
    @name = name
    @rooms = {}

    caps.each do |name, cap|
      @rooms[name] = Room.new(cap)
    end
  end

  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.include?(room_name) ? true : false
  end

  def check_in(person, room_name)
    if self.room_exists?(room_name)
      if @rooms[room_name].add_occupant(person)
        puts "check in successful"
      else
        puts("sorry , room is full.")
      end
    else
      puts("sorry , room does not exist.")
    end
  end

  def has_vacancy?
    @rooms.each { |key, value| return true unless value.full? }
    return false
  end

  def list_rooms
    @rooms.each { |key, value| puts("#{key} #{value.available_space}")}
  end
end
