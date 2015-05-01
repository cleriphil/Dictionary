require('sinatra')
require('sinatra/reloader')
require('./lib/definition')
require('./lib/word')
also_reload('/lib/**/*.rb')


get('/') do
  @words = Word.all()
  erb(:index)
end

post('/words') do
  @word = params.fetch('word')
  word = Word.new(@word)
  word.save()
  erb(:word_success)
end

get('/words/:id') do
  @word = Word.find(params.fetch('id').to_i())
  erb(:word)
end

post('/definitions') do
  part_of_speech = params.fetch('part_of_speech')
  meaning = params.fetch('meaning')
  @definition = Definition.new({ :part_of_speech => part_of_speech, :meaning => meaning})
  @definition.save()
  @word = Word.find(params.fetch('word_id').to_i())
  @word.add_definition(@definition)
  erb(:definition_success)
end
