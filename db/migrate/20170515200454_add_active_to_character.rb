class AddActiveToCharacter < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :active, :boolean
  end
end
