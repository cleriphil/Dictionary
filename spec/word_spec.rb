require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end
  describe('#name') do
    it('returns the name of the word') do
      word_1 = Word.new("bottle")
      expect(word_1.name()).to(eq("bottle"))
    end
  end
  describe('#definitions') do
    it('returns the list of definitions and starts empty') do
    word_1 = Word.new("bottle")
    expect(word_1.definitions()).to(eq([]))
    end
  end
  describe('#add_definition') do
    it('adds a definition to a word') do
      word_1 = Word.new("baby")
      definition_1 = Definition.new({ :meaning => "a small human", :part_of_speech => "noun"})
      word_1.add_definition(definition_1)
      expect(word_1.definitions()).to(eq([definition_1]))
    end
  end
  describe('.all') do
    it('is an empty array at first') do
      expect(Word.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('saves the word to the array of saved words') do
      word_1 = Word.new("bottle")
      word_1.save()
      expect(Word.all()).to(eq([word_1]))
    end
  end
  describe('#id') do
    it('returns the id of the word') do
      word_1 = Word.new("bottle")
      word_1.save()
      expect(word_1.id()).to(eq(1)) #check
    end
  end
  describe('.find') do
    it('returns the word based on its id') do
      word_1 = Word.new("sculpture")
      word_1.save()
      expect(Word.find(word_1.id())).to(eq(word_1))
    end
  end
  describe('.clear') do
    it('empties the array of saved words') do
      word_1 = Word.new("sculpture")
      word_1.save()
      word_2 = Word.new("painting")
      word_2.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end
end
