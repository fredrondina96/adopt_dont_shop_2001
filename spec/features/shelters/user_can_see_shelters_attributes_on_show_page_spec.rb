require 'rails_helper'

RSpec.describe "Shelters Show Page", type: :feature do
  it "shows shelter attributes on show page" do
    shelter1 = Shelter.create(name: 'Ricardos Reptiles', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    visit "shelters/#{shelter1.id}"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter1.address)
    expect(page).to have_content(shelter1.city)
    expect(page).to have_content(shelter1.state)
    expect(page).to have_content(shelter1.zip)

  end

  it "shelter can be deleted from show page" do
    shelter1 = Shelter.create(name: 'Ricardos Reptiles', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    visit "shelters/#{shelter1.id}"

    click_link ('Delete Shelter')

    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content(shelter1.name)
  end

  it "shelter can be edited from show page" do
    shelter1 = Shelter.create(name: 'Ricardos Reptiles', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    visit "shelters/#{shelter1.id}"

    click_link ('Update Shelter')

    expect(current_path).to eq("/shelters/#{shelter1.id}/edit")

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
    expect(page).to_not have_content("Ricardos Reptiles")

  end
end
