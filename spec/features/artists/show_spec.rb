require 'rails_helper'

RSpec.describe 'the artists show page' do

  it 'displays the artists name associated with given id' do
    record1 = RecordLabel.create!(name: "Pure Noise Records")
    artist1 = Artist.create!(name: "Knocked Loose", member_count: 5, album_count:4, actively_touring: true, record_label_id: record1.id)
    visit "artists/#{artist1.id}"

    expect(current_path).to eq("/artists/#{artist1.id}")
    expect(page).to have_content("Knocked Loose")
    expect(page).to have_content("Member Count: 5")
    expect(page).to have_content("Album Count: 4")
    expect(page).to have_content("Actively Touring: true")
  end

end
