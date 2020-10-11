require 'rails_helper'


describe "As a visitor" do
  describe "when I visit shelters/new" do
    it "I fill out a form with name, address, city, state, and zip." do

      visit "/shelters/new"
      fill_in "shelter[name]", with: "Clean Shelter"
      fill_in "shelter[address]", with: "2349 South Street"
      fill_in "shelter[city]", with: "Erie"
      fill_in "shelter[state]", with: "CO"
      fill_in "shelter[zip]", with: "80312"
      click_button("Create Shelter")
      expect(current_path).to eq("/shelters")
      expect(page).to have_content("Clean Shelter")
    end
    it "There is a link to view all pets" do
      visit "/shelters/new"
      click_link("View all Pets")
      expect(current_path).to eq("/pets")
    end
    it "There is a link to view all shelters" do
      visit "/shelters/new"
      click_link("View all Shelters")
      expect(current_path).to eq("/shelters")
    end
  end
end