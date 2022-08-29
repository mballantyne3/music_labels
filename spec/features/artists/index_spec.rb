require 'rails_helper'

RSpec.describe 'the artists index page' do

  it 'displays a list of the artists and their attributes' do
    record1 = RecordLabel.create!(name: "Pure Noise Records")
    artist1 = Artist.create!(name: "Knocked Loose", member_count: 5, album_count:4, actively_touring: true, record_label_id: record1.id)
    artist2 = Artist.create!(name: "Counterparts", member_count: 5, album_count:6, actively_touring: true, record_label_id: record1.id)
    visit "/artists"

    expect(page).to have_content(artist1.name)
    expect(page).to have_content(artist2.name)
    expect(page).to have_content(artist1.member_count)
    expect(page).to have_content(artist2.member_count)
    expect(page).to have_content(artist1.album_count)
    expect(page).to have_content(artist2.album_count)
    expect(page).to have_content("Actively Touring: true")
  end

  it 'displays a link on any page that takes user to the artists index' do
    record1 = RecordLabel.create!(name: "Pure Noise Records")
    artist1 = Artist.create!(name: "Knocked Loose", member_count: 5, album_count:4, actively_touring: true, record_label_id: record1.id)
    artist2 = Artist.create!(name: "Counterparts", member_count: 5, album_count:6, actively_touring: true, record_label_id: record1.id)

    visit "/record_labels"
    click_on "Artists"
    expect(current_path).to eq("/artists")

    visit "/record_labels/#{record1.id}"
    click_on "Artists"
    expect(current_path).to eq("/artists")

    visit "/artists/#{artist1.id}"
    click_on "Artists"
    expect(current_path).to eq("/artists")

    visit "/record_labels/#{record1.id}/artists"
    click_on "Artists"
    expect(current_path).to eq("/artists")
  end

  it 'only displays records with `true` actively touring' do
    record_label1= RecordLabel.create!(name: "Pure Noise Records")
    touring_artist1 = record_label1.artists.create!(name: "Knocked Loose", actively_touring: true)
    touring_artist2 = record_label1.artists.create!(name: "Counterparts", actively_touring: true)
    non_touring_artist = record_label1.artists.create!(name: "Circa Survive", actively_touring: false)

    visit "/artists"

    expect(page).to have_content("Knocked Loose")
    expect(page).to have_content("Counterparts")
    expect(page).to_not have_content("Circa Survive")
  end
end
