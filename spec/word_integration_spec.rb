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
  expect(page).to have_content('Definitions for paint')
  fill_in('part_of_speech', :with => 'noun')
  fill_in('meaning', :with => 'a liquid substance')
  click_button('Add Definition')
  expect(page).to have_content('Your definition has been added')
  click_link('Back Home')
  expect(page).to have_content('Your Dictionary')
  end
end
