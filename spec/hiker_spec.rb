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

    it 'has not visited parks bty default'
    hiker = Hiker.new('Dora', :moderate)

    expect(hiker.parks_visited).to eq([])
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
end
