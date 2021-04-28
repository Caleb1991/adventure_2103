class Trail
  attr_reader :name,
              :length,
              :level
  def initialize(trail_info)
    @name = trail_info[:name]
    @length = trail_length_conversion(trail_info[:length])
    @level = trail_info[:level]
  end

  def trail_length_conversion(string)
    new_string = string.split(' ')
    new_string[0].to_f
  end
end
