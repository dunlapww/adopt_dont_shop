require 'rails_helper'

describe "As a visitor" do
  describe "When I visit /pets" do
    before(:each) do
      @shelter_1 = Shelter.create(name: "Awesome Shelter",
                                  address: "2345 South St",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80210")

      @pet_1 = @shelter_1.pets.create(name: "Jax",
                                  age: 5,
                                  sex: "male",
                                  image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg"
                                  )

      @pet_2 = @shelter_1.pets.create(name: "Max",
                                    age: 2,
                                    sex: "male",
                                    image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/black-dog-breeds-black-labrador-retriever-1566497968.jpg")
    
    end
    it "I see each Pet in the system including teh Pet's: image, name, age, sex" do
      visit "/pets"
      Pet.all.each do |pet|
        expect(page).to have_content(pet.name)
        expect(page).to have_content(pet.age)
        expect(page).to have_content(pet.sex)
        expect(page).to have_xpath("//img[contains(@src,'#{pet.image}')]")
        expect(page).to have_button("Delete #{pet.name}")
        expect(page).to have_button("Update #{pet.name}")
        # page.find(:css, "a[href$='/pets/#{pet.id}/edit']")
        # page.find(:css,  "a[href$='/pets/#{pet.id}/edit']")  
        
      end
    end
    it "Each pets view details button takes me to the pets show page" do
      visit "/pets"
      click_button("View #{@pet_1.name} Details")
      expect(current_path).to eq("/pets/#{@pet_1.id}")
    end
    it "Each pets update details button takes me to the pets update page" do
      visit "/pets"
      click_button("Update #{@pet_1.name}")
      expect(current_path).to eq("/pets/#{@pet_1.id}/edit")
    end
    it "Each pets delete button deletes the pet and returns me to /pets" do
      visit "/pets"
      click_button("Delete #{@pet_1.name}")
      expect(current_path).to eq("/pets")
      expect(page).to_not have_content("#{@pet_1.name}")
    end
  end
end
