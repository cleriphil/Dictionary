require('rspec')
require('definition')

describe(Definition) do
  describe('#meaning') do
    it('returns the meaning of the word') do
      baby = Definition.new({ :meaning => "a small human", :part_of_speech => "noun"})
      expect(baby.meaning()).to(eq("a small human"))
    end
  end
end
