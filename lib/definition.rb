class Definition
  attr_reader(:meaning, :part_of_speech)
  define_method(:initialize) do |attributes|
    @meaning = attributes.fetch(:meaning)
    @part_of_speech = attributes.fetch(:part_of_speech)

  end
end
