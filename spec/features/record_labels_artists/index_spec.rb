require 'rails_helper'

RSpec.describe 'record labels artist index' do
  before :each do
    @pure_noise = RecordLabel.create!(name: "Pure Noise Records")
    @knocked_loose = @pure_noise.artists.create!(name: "Knocked Loose", member_count: 5, album_count: 4, actively_touring: true)
    @counterparts = @pure_noise.artists.create!(name: "Counterparts", member_count: 5, album_count: 6, actively_touring: true)
  end

  it 'shows all artists associated with given record label id' do
    visit "/record_labels/#{@pure_noise.id}/artists"

    expect(page).to have_content("Artists of Pure Noise Records")
    expect(page).to have_content(@knocked_loose.name)
    expect(page).to have_content(@counterparts.name)
  end

  it 'shows all artists attributes associated with given record label id' do
    visit "/record_labels/#{@pure_noise.id}/artists"

    within 'li', text: 'Knocked Loose' do
      expect(page).to have_content("Member Count: #{@knocked_loose.member_count}")
      expect(page).to have_content("Album Count: #{@knocked_loose.album_count}")
      expect(page).to have_content("Actively Touring: #{@knocked_loose.actively_touring}")
    end

    within 'li', text: 'Counterparts' do
      expect(page).to have_content("Member Count: #{@counterparts.member_count}")
      expect(page).to have_content("Album Count: #{@counterparts.album_count}")
      expect(page).to have_content("Actively Touring: #{@counterparts.actively_touring}")
    end
  end

  it 'links to the add new artists page for that record label' do
    record_label = RecordLabel.create!(name: 'Sumerian Records')

    visit "/record_labels/#{record_label.id}/artists"

    click_link "Create Artist"

    expect(current_path).to eq("/record_labels/#{record_label.id}/artists/new")
  end

  it 'can add a new artist to the record label' do
    record_label = RecordLabel.create!(name: 'Pure Noise Records')

    visit "/record_labels/#{record_label.id}/artists/new"

    fill_in('Name', with: "The Story So Far")
    fill_in('Member count', with: 5)
    fill_in('Album count', with: 4)
    fill_in('Actively touring', with: true)

    click_button 'Create Artist'

    expect(current_path).to eq("/record_labels/#{record_label.id}/artists")
    expect(page).to have_content("The Story So Far")
    expect(page).to have_content('Member Count: 5')
    expect(page).to have_content('Album Count: 4')
    expect(page).to have_content('Actively Touring: true')
  end
end
