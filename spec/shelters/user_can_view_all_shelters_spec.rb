require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "shows all shelters on the index page " do

    shelter1 = Shelter.create(name: 'Ricardos Reptiles', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")
    shelter2 = Shelter.create(name: "Freds Felines", address: "5678 st", city: 'Seattle', state: 'Washington', zip: "390507")
    shelter3 = Shelter.create(name: "Monroes Monitors", address: '2948 st', city: 'San Diego', state: 'California', zip: "30958")

    visit '/shelters'

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
    expect(page).to have_content(shelter3.name)

  end
end
