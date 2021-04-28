class Park
  attr_reader :name,
              :trails

  def initialize(name)
    @name = name
    @trails = []
  end

  def add_trail(trail)
    @trails << trail
  end

  def trails_shorter_than(mileage)
    @trails.find_all do |trail|
      trail.length < mileage
    end
  end

  def hikeable_miles
    @trails.sum do |trail|
      trail.length
    end
  end

  def trails_by_level
    hash = {}

    second_trail_level_helper.each do |level|
      hash[level] = trails_level_helper(level)
    end
    hash
  end

  def trails_level_helper(difficulty)
    instances = @trails.find_all do |trail|
      trail.level == difficulty
    end

    names = instances.map do |trail|
      trail.name
    end
  end

  def second_trail_level_helper
    @trails.map do |trail|
      trail.level
    end.uniq
  end
end
