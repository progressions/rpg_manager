class AddPrivateToEncounter < ActiveRecord::Migration[5.1]
  def change
    add_column :encounters, :private, :boolean
  end
end
