require 'rails_helper'

describe "As a visitor" do
  describe "When I visit /pets" do
    it "I see each Pet in the system including teh Pet's: image, name, age, sex, shelter_name" do

      shelter_1 = Shelter.create(name: "Awesome Shelter",
                                  address: "2345 South St",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80210")

      pet_1 = shelter_1.pets.create(name: "Jax",
                                  age: 5,
                                  sex: "male",
                                  image: "https://dogtime.com/assets/uploads/2018/10/puppies-cover.jpg"
                                  )

      pet_2 = shelter_1.pets.create(name: "Max",
                                    age: 2,
                                    sex: "male",
                                    image: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/black-dog-breeds-black-labrador-retriever-1566497968.jpg")
    
      visit "/pets"
      Pet.all.each do |pet|
        expect(page).to have_content(pet.name)
        expect(page).to have_content(pet.age)
        expect(page).to have_content(pet.sex)
        expect(page).to have_content(pet.shelter.name)
        expect(page).to have_xpath("//img[contains(@src,'#{pet.image}')]")
        page.find(:css, "a[href$='/pets/#{pet.id}/edit']")
        expect(page).to have_link("Delete #{pet.name}")
        page.find(:css, "a[href$='/pets/#{pet.id}']")
        expect(page).to have_link("Update #{pet.name}")
        page.find(:css, "a[href$='/pets/#{pet.id}/edit']")  

      end
    end
  end
end
