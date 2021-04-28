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
end
