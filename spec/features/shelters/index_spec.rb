require 'rails_helper'

describe "As a user" do
  describe "when I visit /shelters" do
    before(:each) do
      @shelter_1 = Shelter.create(name: "Awesome Shelter",
                                address: "2345 South St",
                                city: "Denver",
                                state: "CO",
                                zip: "80210")

    end
    it " see the name of each shelter in the system" do
      visit "/shelters"
      Shelter.all.each do |shelter|
        expect(page).to have_link("#{shelter.name}")
        expect(page).to have_button("Edit Shelter")
        expect(page).to have_button("Delete Shelter")
      end
    end
     it "There is a link to view all pets" do
      visit "/shelters"
      click_link("View all Pets")
      expect(current_path).to eq("/pets")
    end
    it "There is a link to view all shelters" do
      visit "/shelters"
      click_link("View all Shelters")
      expect(current_path).to eq("/shelters")
    end
    it "There is a link to create a new shelter" do
      visit "/shelters"
      click_link("New Shelter")
      expect(current_path).to eq("/shelters/new")
    end
    it "each shelter view link takes me to /shelter/:id" do
      visit "/shelters"
      click_link("#{@shelter_1.name}")
      expect(current_path).to eq("/shelters/#{@shelter_1.id}")
    end
    it "each shelter edit button takes me to /shelter/:id" do
      visit "/shelters"
      click_button("Edit Shelter")
      expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
    end
    it "each shelter delete button deletes the shelter and returns me to /shelters" do
      visit "/shelters"
      click_button("Delete Shelter")
      expect(current_path).to eq("/shelters")
      expect(page).to_not have_content("#{@shelter_1.name}")
    end
  end
end