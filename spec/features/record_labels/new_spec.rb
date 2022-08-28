require 'rails_helper'

RSpec.describe 'the Record Label creation' do
  it 'links to the new page from the record labels index' do
    visit '/record_labels'
    click_link('New Record Label')
    expect(current_path).to eq('/record_labels/new')
  end

  it 'can create a new record label' do
    visit '/record_labels/new'
    fill_in('Name', with: 'Pure Noise Records')
    fill_in('Revenue', with: 1500000)
    fill_in('Location', with: 'Tennessee')

    click_button('Create Record Label')

    expect(current_path).to eq("/record_labels")
    expect(page).to have_content("Pure Noise Records")
  end
end
