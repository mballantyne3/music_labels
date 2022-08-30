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

  #   As a visitor
  #   When I visit the parent index page
  #   Next to every parent, I see a link to edit that parent's info
  # When I click the link
  # I should be taken to that parent's edit page where I can update its information just like in User Story 12
  it 'allows user to edit the record labels info from record labels page' do
    record1 = RecordLabel.create!(name: "Pure Noise Records")

    visit "/record_labels"
    click_button "Edit #{record1.name}"

    expect(current_path).to eq("record_labels/#{record_label.id}/edit")
  end
end
