require 'rails_helper'
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
#   When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
RSpec.describe 'the Record Label creation' do
  it 'links to the new page from the record labels index' do
    visit '/record_labels'
    click_link('New Record Label')
    expect(current_path).to eq('/record_labels/new')
  end

  it 'can create a new record label' do
    visit '/record_labels/new'
    fill_in('Name', with: 'Pure Noise Records')
    fill_in('Revenue', with: 1500000)
    fill_in('Location', with: 'Tennessee')

    click_button('Create Record Label')

    expect(current_path).to eq("/record_labels")
    expect(page).to have_content("Pure Noise Records")
  end
end
