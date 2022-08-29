require 'rails_helper'

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
