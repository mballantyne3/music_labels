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
end
