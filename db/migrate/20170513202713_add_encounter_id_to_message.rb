class AddEncounterIdToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :encounter_id, :integer
  end
end
