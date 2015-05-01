require('rspec')
require('definition')

describe(Definition) do
  before() do
    Definition.clear()
  end
  describe('#meaning') do
    it('returns the meaning of the word') do
      definition_1 = Definition.new({ :meaning => "a small human", :part_of_speech => "noun"})
      expect(definition_1.meaning()).to(eq("a small human"))
    end
  end
  describe('.all') do
    it('starts as an empty array') do
      expect(Definition.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('saves the definition to an array of saved definitions') do
      definition_1 = Definition.new({ :meaning => "a small human", :part_of_speech => "noun"})
      definition_1.save()
      expect(Definition.all()).to(eq([definition_1]))
    end
  end
  describe('.clear') do
    it('clears the array of saved definitions') do
      definition_1 = Definition.new({ :meaning => "a small human", :part_of_speech => "noun"})
      definition_1.save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end
end
