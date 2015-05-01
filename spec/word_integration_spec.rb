require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_expectations, false)


describe('the path of the Word class', {:type => :feature}) do
  it('processes the user input returns a list of words in the homepage') do
  visit('/')
  fill_in('word', :with => 'paint')
  click_button('Add Word')
  expect(page).to have_content('Your word has been added!')
  click_link('Back Home')
  click_link('paint')
  expect(page).to have_content('This is your word')
  expect(page).to have_content('paint')
  end
end
