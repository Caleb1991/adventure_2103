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
  end
end
