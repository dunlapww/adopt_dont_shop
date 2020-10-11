class RenameAdoptableToStatus < ActiveRecord::Migration[5.2]
  def change
    rename_column :pets, :adoptable, :status
  end
end
