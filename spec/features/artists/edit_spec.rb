require 'rails_helper'

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
RSpec.describe 'artist update/edit' do
  it 'links to the update artist page' do
    record1 = RecordLabel.create!(name: 'Pure Noise Records')
    artist1 = record1.artists.create!(name: 'Counterparts')

    visit "/artists/#{artist1.id}"

    click_link "Update #{artist1.name}"

    expect(current_path).to eq("/artists/#{artist1.id}/edit")
  end

  it 'can update/edit the artist' do
    record1 = RecordLabel.create!(name: 'Pure Noise Records')
    artist1 = record1.artists.create!(name: 'Counterpart')

    visit "/artists/#{artist1.id}"

    expect(page).to have_content('Counterpart')

    visit "/artists/#{artist1.id}/edit"

    fill_in('Name', with: "Counterparts")
    fill_in('Member count', with: 4)
    fill_in('Album count', with: 5)
    fill_in('Actively touring', with: true)
    click_button 'Submit'

    expect(current_path).to eq("/artists/#{artist1.id}")
    expect(page).to have_content('Counterparts')
  end
end
