class CreateEncounters < ActiveRecord::Migration[5.1]
  def change
    create_table :encounters do |t|
      t.string :name

      t.timestamps
    end
  end
end
