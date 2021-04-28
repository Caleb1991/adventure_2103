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
end
