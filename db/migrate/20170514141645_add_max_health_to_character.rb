class AddMaxHealthToCharacter < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :max_health, :integer
  end
end
