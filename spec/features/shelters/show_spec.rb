require 'rails_helper'

describe "As a visitor" do
  describe "when I visit /shelters/:id" do
    before(:each) do
      @shelter_1 = Shelter.create(name: "Awesome Shelter",
                                address: "2345 South St",
                                city: "Denver",
                                state: "CO",
                                zip: "80210")
    end
    it "I see the shelter's name, address, city, state, and zip" do
      visit "/shelters/#{@shelter_1.id}"
      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_1.address)
      expect(page).to have_content(@shelter_1.city)
      expect(page).to have_content(@shelter_1.state)
      expect(page).to have_content(@shelter_1.zip)
      expect(page).to have_button("View our pets for adoption!")
      expect(page).to have_button("Update Shelter")
      expect(page).to have_button("Delete Shelter")
    end
    it "There is a link to view all pets" do
      visit "/shelters/#{@shelter_1.id}"
      click_link("View all Pets")
      expect(current_path).to eq("/pets")
    end
    it "There is a link to view all shelters" do
      visit "/shelters/#{@shelter_1.id}"
      click_link("View all Shelters")
      expect(current_path).to eq("/shelters")
    end
    it "There is a link to view all pets" do
      visit "/shelters/#{@shelter_1.id}"
      click_button("View our pets for adoption!")
      expect(current_path).to eq("/shelters/#{@shelter_1.id}/pets")
    end
    it "There is a link to update the shelter" do
      visit "/shelters/#{@shelter_1.id}"
      click_button("Update Shelter")
      expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
    end
    it "There is a link to delete the shelter which removes shelter and rerotues me to /shelters" do
      visit "/shelters/#{@shelter_1.id}"
      click_button("Delete Shelter")
      expect(current_path).to eq("/shelters")
      expect(page).to_not have_content(@shelter_1.name)
    end

  end
end