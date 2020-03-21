require "rails_helper"

RSpec.describe "As a user When I visit '/pets/:id'", type: :feature do
    it "I see all of the pets information" do

      shelter1 = Shelter.create!(name: "Larry's Lizards", address: "1331 17th Street", city: 'Denver', state: 'CO', zip: "80202")

      pet1 = shelter1.pets.create!(name: "Sam", description: "Slippery Snake", adoption_status: "Available", age: "12", sex: "Female", image: "https://66.media.tumblr.com/6a9b0ea4859319c0defd9681b3a78e8f/tumblr_n8o33kXRnG1qhaglio1_r1_1280.png")
      pet2 = shelter1.pets.create!(name: "Melo", age: "3",description: "Slipperier Snake", adoption_status: "Available", sex: "Male", image: "https://i.pinimg.com/474x/8f/c4/68/8fc46860f9f52463e4e9db1ec32044f4--hady-reptile-room.jpg")

      visit "/pets/#{pet1.id}"

      expect(page).to have_content(pet1.name)
      expect(page).to have_content(pet1.age)
      expect(page).to have_content(pet1.sex)
      expect(page).to have_content(pet1.description)
      expect(page).to have_content(pet1.adoption_status)

      visit "/pets/#{pet2.id}"

      expect(page).to have_content(pet2.name)
      expect(page).to have_content(pet2.age)
      expect(page).to have_content(pet2.sex)
      expect(page).to have_content(pet2.description)
      expect(page).to have_content(pet2.adoption_status)

  end
end