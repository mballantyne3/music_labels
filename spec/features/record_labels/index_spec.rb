require 'rails_helper'

RSpec.describe 'the record labels index page' do

  it 'displays a list of the record labels and their name' do
    record1 = RecordLabel.create!(name: "Pure Noise Records")
    record2 = RecordLabel.create!(name: "Sumerian Records")
    visit "/record_labels"

    expect(page).to have_content(record1.name)
    expect(page).to have_content(record2.name)
  end

  it 'displays a link on any page that takes the user to the record labels index' do
    record1 = RecordLabel.create!(name: "Pure Noise Records")
    artist1 = Artist.create!(name: "Knocked Loose", member_count: 5, album_count:4, actively_touring: true, record_label_id: record1.id)

    visit "/artists"
    click_on "Record Labels"
    expect(current_path).to eq("/record_labels")

    visit "/artists/#{artist1.id}"
    click_on "Record Labels"
    expect(current_path).to eq("/record_labels")

    visit "/record_labels/#{record1.id}"
    click_on "Record Labels"
    expect(current_path).to eq("/record_labels")

    visit "/record_labels/#{record1.id}/artists"
    click_on "Record Labels"
    expect(current_path).to eq("/record_labels")
  end

  it 'orders records by most recently created first and displays when it was created' do
    record1 = RecordLabel.create!(name: "Pure Noise Records")
    record2 = RecordLabel.create!(name: "Sumerian Records")
    visit "/record_labels"

    within "tbody tr:nth-child(1)" do
      expect(page).to have_content "Pure Noise Records"
      expect(page).to have_content(record1.created_at)
    end

    within "tbody tr:nth-child(2)" do
      expect(page).to have_content "Sumerian Records"
      expect(page).to have_content(record2.created_at)
    end
  end
end
