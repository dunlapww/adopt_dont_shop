class AddDescriptionAdoptableToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :adoptable, :string
    add_column :pets, :description, :string
  end
end
