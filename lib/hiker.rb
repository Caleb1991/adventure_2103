class Hiker
  attr_reader :name,
              :experience_level,
              :snacks,
              :parks_visited

  def initialize(name, experience_level)
    @name = name
    @experience_level = experience_level
    @snacks = Hash.new(0)
    @parks_visited = []
  end

  def pack(item, quantity)
    @snacks[item] += quantity
  end

  def visit_park(park)
    @parks_visited << park
  end

  def trails_at_parks_visited
    @parks_visited.flat_map do |park|
      park.trails
    end
  end

  def possible_trails
    trails_at_parks_visited.find_all do |trail|
      trail.level == @experience_level
    end
  end
end
