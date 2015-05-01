require('sinatra')
require('sinatra/reloader')
also_reload('/lib/**/*.rb')
require('./lib/word')

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
  @definitions = Definition.all()
  erb(:word)
end

post('/definitions') do
  part_of_speech = params.fetch('part_of_speech')
  meaning = params.fetch('meaning')
  @definition = Definition.new({ :part_of_speech => part_of_speech, :meaning => meaning})
  @definition.save()
  erb(:definition_success)
end
