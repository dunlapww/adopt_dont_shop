require 'rails_helper'

describe "As a user" do
  describe "when I visit /shelters" do
    it " see the name of each shelter in the system" do
      shelter_1 = Shelter.create(name: "Awesome Shelter",
                                address: "2345 South St",
                                city: "Denver",
                                state: "CO",
                                zip: "80210")

      
      visit "/shelters"
      
      Shelter.all.each do |shelter|
        expect(page).to have_content("View #{shelter.name}")
        expect(page).to have_link("Edit #{shelter.name}")
        page.find(:css, "a[href$='/shelters/#{shelter.id}/edit']")
      end
    end
  end
end