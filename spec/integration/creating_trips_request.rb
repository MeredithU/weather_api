require 'spec_helper'

feature 'Creating Trip' do
  before do
    visit '/'
    click_link 'New Trip'
  end

  scenario "can create a trip" do
    fill_in 'Starting Zip Code', :with => 'Let us start here'
    fill_in 'Destination Zip Code', :with => 'Are we there yet'
    click_button 'Create Trip'
    page.should have_content('Trip has been created.')
    trip = Trip.find_by_name("TextMate 2")
    page.current_url.should == trip_url(trip)
    title = "Trip"
    find("title").should have_content(title)
  end

  scenario "can not create a trip without a zip code" do
    click_button 'Create Trip'
    page.should have_content("Trip has not been created.")
    page.should have_content("Zip code can't be blank")
  end
end
