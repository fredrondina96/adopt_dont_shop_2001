require "rails_helper"

RSpec.describe "From the Shelters Index Page", type: :feature do
  it "user can click link to update shelter information" do

      shelter1 = Shelter.create!(name: "Larry's Lizards", address: "1331 17th Street", city: 'Denver', state: 'CO', zip: "80202")

      visit "/shelters"

      click_link ("Edit Shelter")

      fill_in "name", with: "AAA"
      fill_in "address", with: "BBB"
      fill_in "city", with: "CCC"
      fill_in "state", with: "DDD"
      fill_in "zip", with: "EEE"

      click_button ("Update Shelter")

      expect(current_path).to eq("/shelters/#{shelter1.id}")
      expect(page).to have_content("AAA")
      expect(page).to have_content("BBB")
      expect(page).to have_content("CCC")
      expect(page).to have_content("DDD")
      expect(page).to have_content("EEE")
      expect(page).to_not have_content("Larry's Lizards")

# User Story 13, Shelter Update From Shelter Index Page
#
# As a visitor
# When I visit the shelter index page
# Next to every shelter, I see a link to edit that shelter's info
# When I click the link
# I should be taken to that shelters edit page where I can update its information just like in User Story 5
  end
end
