class Word
  attr_reader(:name, :id)
  @@words = []
    define_method(:initialize) do |name|
      @name = name
      @id = @@words.length().+(1)
    end

    define_singleton_method(:all) do
      @@words
    end
    define_method(:save) do
      @@words.push(self)
    end
    define_singleton_method(:clear) do
      @@words = []
    end

    define_singleton_method(:find) do |identification|
      this_word = nil
        @@words.each() do |word|
          if word.id().eql?(identification)
            this_word = word
          end
        end
        this_word
    end

    # define_method(:add_definition) do
    # end
end
