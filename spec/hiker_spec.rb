require './lib/hiker'
require './lib/park'
require './lib/trail'

RSpec.describe Hiker do

  describe 'initialize' do
    it 'exists' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker).is_a?(Hiker)
    end

    it 'has a name' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker.name).to eq('Dora')
    end

    it 'has an experience level' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker.experience_level).to eq(:moderate)
    end

    it 'has no snacks by default' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker.snacks).to eq({})
    end

    it 'has not visited parks by default' do
      hiker = Hiker.new('Dora', :moderate)

      expect(hiker.parks_visited).to eq([])
    end
  end

  describe '#pack' do
    it 'packs a given quantity of a snack' do
      hiker = Hiker.new('Dora', :moderate)

      hiker.pack('water', 1)
      hiker.pack('trail mix', 3)

      expected = {
        'water' => 1,
        'trail mix' => 3
      }

      expect(hiker.snacks).to eq(expected)
    end
  end

  describe '#visit_park' do
    it 'adds a park to the park array' do
      hiker = Hiker.new('Dora', :moderate)
      park = Park.new('Capitol Reef')

      hiker.visit_park(park)

      expect(hiker.parks_visited).to eq([park])
    end
  end

  describe '#trails_at_parks_visited' do
    it 'returns array with all trails at parks visited' do
      hiker_1 = Hiker.new('Dora', :moderate)
      park_1 = Park.new('Capitol Reef')
      park_2 = Park.new('Bryce Canyon')
      trail_1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail_2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail_3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
      trail_4 = Trail.new({name: 'Queens/Navajo Loop', length: '2.9', level: :moderate})
      trail_5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
      trail_6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})

      park_1.add_trail(trail_1)
      park_1.add_trail(trail_2)
      park_1.add_trail(trail_3)
      park_2.add_trail(trail_4)
      park_2.add_trail(trail_5)
      park_2.add_trail(trail_6)
      hiker_1.visit_park(park_1)
      hiker_1.visit_park(park_2)

      expected = [trail_1, trail_2, trail_3, trail_4, trail_5, trail_6]

      expect(hiker_1.trails_at_parks_visited).to eq(expected)
    end
  end

  describe '#possible_trails' do
    it 'returns all trails at parks that have been visited and match experience level' do
      hiker_1 = Hiker.new('Dora', :moderate)
      park_1 = Park.new('Capitol Reef')
      park_2 = Park.new('Bryce Canyon')
      trail_1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail_2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail_3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
      trail_4 = Trail.new({name: 'Queens/Navajo Loop', length: '2.9', level: :moderate})
      trail_5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
      trail_6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})

      park_1.add_trail(trail_1)
      park_1.add_trail(trail_2)
      park_1.add_trail(trail_3)
      park_2.add_trail(trail_4)
      park_2.add_trail(trail_5)
      park_2.add_trail(trail_6)
      hiker_1.visit_park(park_1)
      hiker_1.visit_park(park_2)

      expected = [trail_2, trail_4, trail_6]

      expect(hiker_1.possible_trails).to eq(expected)
    end
  end

  describe '#favorite_snack' do
    it 'returns the name of the snack with highest quantity' do
      hiker = Hiker.new('Dora', :moderate)

      hiker.pack('water', 1)
      hiker.pack('trail mix', 3)
      hiker.pack('apple', 4)

      expect(hiker.favorite_snack).to eq('apple')
    end
  end
end
