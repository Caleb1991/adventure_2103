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
end
