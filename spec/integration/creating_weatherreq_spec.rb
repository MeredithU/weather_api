require 'spec_helper'

feature 'Creating Weather Request' do
  scenario "can create a weather request" do
    visit '/'
    click_link 'New Forecast'

    #fill_in 'Name', :with => 'TextMate 2'
    #fill_in 'Description', :with => "A text-editor for OS X"
    click_button 'Create Forecast'
    page.should have_content('Forecast has been created.')
  end
end
