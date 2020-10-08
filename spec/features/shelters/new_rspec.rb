require 'rails_helper'

describe "As a visitor" do
  describe "When I visit the Shelter Index page" do
    it "I see a link to create a new shelter" do

      visit "/shelters"

      expect(page).to have_content("New Shelter")
    end
  end
end

describe "As a visitor" do
  describe "When I click the new shelter link" do
    it "I am taken to '/shelter/new'" do

      visit "/shelters"
      click_link("New Shelter")
      expect(current_path).to eq("/shelters/new")
    end
  end
end

describe "As a visitor" do
  describe "When I am taken to '/shelter/new' via the New Shelter link" do
    it "I fill out a form with name, address, city, state, and zip.  Also when I clikc on link a `POST` request is sent to '/shelters', a new shelter is created, and I am redirected to the Shelter Index page where I see the new Shelter listed." do

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
  end
end