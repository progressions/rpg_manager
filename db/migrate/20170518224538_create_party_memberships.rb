class CreatePartyMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :party_memberships do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :encounter, foreign_key: true

      t.timestamps
    end
  end
end
