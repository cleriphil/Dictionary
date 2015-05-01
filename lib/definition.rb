class Definition
  attr_reader(:meaning, :part_of_speech, :id)
  @@definitions = []
  define_method(:initialize) do |attributes|
    @meaning = attributes.fetch(:meaning)
    @part_of_speech = attributes.fetch(:part_of_speech)
    @id = @@definitions.length().+(1)
  end
  define_singleton_method(:all) do
    @@definitions
  end
  define_method(:save) do
    @@definitions.push(self)
  end
  define_singleton_method(:clear) do
    @@definitions = []
  end
end
