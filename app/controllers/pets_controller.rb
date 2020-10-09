class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end
  
  def shelter_pets
    
  end
end
