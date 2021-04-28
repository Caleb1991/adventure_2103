require './lib/trail'

RSpec.describe Trail do

  describe 'initialize' do
    it 'exists' do
      trail = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

      expect(trail).is_a?(Trail)
    end

    it 'has a name' do
      trail = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

      expect(trail.name).to eq('Grand Wash')
    end

    it 'has a length' do
      trail = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

      expect(trail.length).to eq(2.2)
    end

    it 'has a difficulty level' do
      trail = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

      expect(trail.level).to eq(:easy)
    end
  end

  describe 'trail_length_conversion' do
    it 'converts given string to float' do
      trail = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})

      expect(trail.trail_length_conversion('132 miles')).to eq(132.0)
    end
  end
end
