require('rspec')
require('definition')

describe(Definition) do
  before() do
    Definition.clear()
  end
  describe('#meaning') do
    it('returns the meaning of the word') do
      baby = Definition.new({ :meaning => "a small human", :part_of_speech => "noun"})
      expect(baby.meaning()).to(eq("a small human"))
    end
  end
  describe('.all') do
    it('starts as an empty array') do
      expect(Definition.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('saves the definition to an array of saved definitions') do
      baby = Definition.new({ :meaning => "a small human", :part_of_speech => "noun"})
      baby.save()
      expect(Definition.all()).to(eq([baby]))
    end
  end
  describe('.clear') do
    it('clears the array of saved definitions') do
      baby = Definition.new({ :meaning => "a small human", :part_of_speech => "noun"})
      baby.save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end
end
