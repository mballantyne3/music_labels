require 'rails_helper'

RSpec.describe 'the record labels index page' do

  it 'displays a list of the record labels and their name' do
    record1 = RecordLabel.create!(name: "Pure Noise Records")
    record2 = RecordLabel.create!(name: "Sumerian Records")
    visit "/record_labels"

    expect(page).to have_content(record1.name)
    expect(page).to have_content(record2.name)
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
