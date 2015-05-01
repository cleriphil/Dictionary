require('rspec')
require('word')

describe(Word) do
  describe('#name') do
    it('returns the name of the word') do
      word_1 = Word.new("bottle")
      expect(word_1.name()).to(eq("bottle"))
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
