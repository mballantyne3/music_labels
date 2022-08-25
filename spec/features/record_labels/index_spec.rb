require 'rails_helper'

RSpec.describe 'the record labels index page' do

  it 'displays a list of the record labels and their name' do
    record1 = RecordLabel.create!(name: "Pure Noise Records")
    record2 = RecordLabel.create!(name: "Sumerian Records")
    visit "/record_labels"

    expect(page).to have_content(record1.name)
    expect(page).to have_content(record2.name)
  end
end
