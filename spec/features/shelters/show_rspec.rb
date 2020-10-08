require 'rails_helper'

describe "As a visitor" do
  describe "when I visit /shelters/:id" do
    it "I see the shelter's name, address, city, state, and zip" do

    shelter_1 = Shelter.create(name: "Awesome Shelter",
                                address: "2345 South St",
                                city: "Denver",
                                state: "CO",
                                zip: "80210")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
    expect(page).to have_link("Update Shelter")
    expect(page).to have_button("Delete Shelter")
    
  end
end
end

describe "As a visitor" do
  describe "when I visit /shelters/:id" do
    describe "and click on Update Shelter" do
      it "I am directed to /shelters/:id/edit" do
        shelter_1 = Shelter.create(name: "Awesome Shelter",
          address: "2345 South St",
          city: "Denver",
          state: "CO",
          zip: "80210")
          
          visit "/shelters/#{shelter_1.id}"
          click_link("Update Shelter")
          expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
      end
    end
  end
end
