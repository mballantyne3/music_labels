require 'rails_helper'

RSpec.describe 'the record labels show page' do

  it 'displays the record labels page and attributes with given id' do
    pure_noise = RecordLabel.create!(name: "Pure Noise Records", revenue: 1500000, genre_included: nil, location: "Tennessee")
    visit "record_labels/#{pure_noise.id}"

    expect(current_path).to eq("/record_labels/#{pure_noise.id}")
    expect(page).to have_content("Pure Noise Records")
    expect(page).to have_content("Revenue: 1500000")
    expect(page).to have_content("Location: Tennessee")
    expect(page).to have_content("Genre Included:")
  end

  it 'displays the record labels page and the artist count associated with them' do
    pure_noise = RecordLabel.create!(name: "Pure Noise Records")
    knocked_loose = pure_noise.artists.create!(name: "Knocked Loose")
    counter_parts = pure_noise.artists.create!(name: "Counterparts")
    visit "record_labels/#{pure_noise.id}"

    expect(page).to have_content("Artist Count: 2")
  end

  # As a visitor
  # When I visit a parent show page ('/parents/:id')
  # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
  it 'displays a link to take user to the record labels artists page' do
    pure_noise = RecordLabel.create!(name: "Pure Noise Records")
    knocked_loose = pure_noise.artists.create!(name: "Knocked Loose")
    counter_parts = pure_noise.artists.create!(name: "Counterparts")
    visit "record_labels/#{pure_noise.id}"
    click_on "Pure Noise Records Artists"

    expect(current_path).to eq("/record_labels/#{pure_noise.id}/artists")
  end
end
