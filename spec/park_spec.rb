require './lib/park'
require './lib/trail'

RSpec.describe Park do

  describe 'initialize' do
    it 'exists' do
      park = Park.new('Capitol Reef')

      expect(park).is_a?(Park)
    end

    it 'has a name' do
      park = Park.new('Capitol Reef')

      expect(park.name).to eq('Capitol Reef')
    end

    it 'has no trails by default' do
      park = Park.new('Capitol Reef')

      expect(park.trails).to eq([])
    end
  end

  describe '#add_trail' do
    it 'adds trails to trails array' do
      park = Park.new('Capitol Reef')
      trail_1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail_2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})

      park.add_trail(trail_1)
      park.add_trail(trail_2)

      expect(park.trails).to eq([trail_1, trail_2])
    end
  end

  describe '#trails_shorter_than' do
    it 'returns all trails shorter than the given distance' do
      park = Park.new('Capitol Reef')
      trail_1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail_2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail_3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})

      park.add_trail(trail_1)
      park.add_trail(trail_2)
      park.add_trail(trail_3)

      expect(park.trails_shorter_than(2.5)).to eq([trail_1, trail_2])
    end
  end

  describe '#hikeable_miles' do
    it 'returns the total miles of all trails' do
      park = Park.new('Capitol Reef')
      trail_1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
      trail_2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
      trail_3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})

      park.add_trail(trail_1)
      park.add_trail(trail_2)
      park.add_trail(trail_3)

      expect(park.hikeable_miles).to eq(7.5)
    end
  end

  describe '#trails_level_helper' do
    it 'returns array of trails by difficulty' do
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

      expect(park_1.trails_level_helper(:easy)).to eq(trail_1)
    end
  end

  describe '#trails_by_level' do
    it 'returns hash of level equal to matching trails' do
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

      expected = {
        easy: => ['Grand Wash'],
        moderate: => ['Cohab Canyon'],
        strenuous: => ["Chimney Rock Loop"]
      }

      expect(park_1.trails_by_level).to eq(expected)
    end
  end
end
