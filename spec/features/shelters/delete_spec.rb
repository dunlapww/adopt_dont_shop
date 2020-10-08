require 'rails_helper'

describe "As a visitor" do
  describe "when I visit the show page" do
    it "I see a link to delete the shelter, when clicked the shelter is deleted and I'm redirected to the index page where I no longer see the shelter" do
      
      shelter_1 = Shelter.create(name: "Awesome Shelter",
                                address: "2345 South St",
                                city: "Denver",
                                state: "CO",
                                zip: "80210")
      
      visit "shelters/#{shelter_1.id}"
      click_button("Delete Shelter")
      expect(current_path).to eq("/shelters")
      expect(page).not_to have_content("Awesome Shelter")

      expect(Shelter.all.none? {|shelter| shelter.id == shelter_1.id}).to eq(true)
      
    end
  end
end