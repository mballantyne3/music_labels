require 'rails_helper'

RSpec.describe 'record label update/edit' do
  it 'links to the update record label page' do
    record_label = RecordLabel.create!(name: 'Pure Noise Records')

    visit "/record_labels/#{record_label.id}"

    click_link "Update #{record_label.name}"

    expect(current_path).to eq("/record_labels/#{record_label.id}/edit")
  end

  it 'can update/edit the record label' do
    record_label = RecordLabel.create!(name: 'Pure Nois Records')

    visit "/record_labels/#{record_label.id}"

    expect(page).to have_content('Pure Nois Records')

    visit "/record_labels/#{record_label.id}/edit"
    fill_in('Name', with: "Pure Noise Records")
    click_button 'Submit'

    expect(current_path).to eq("/record_labels/#{record_label.id}")
    expect(page).to have_content('Pure Noise Records')
  end

  it 'allows user to edit the record labels info from record labels page' do
    record_label = RecordLabel.create!(name: "Pure Noise Records")

    visit "/record_labels"
    click_link "Edit #{record_label.name}"

    expect(current_path).to eq("/record_labels/#{record_label.id}/edit")
  end
end
