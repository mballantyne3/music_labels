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
end
