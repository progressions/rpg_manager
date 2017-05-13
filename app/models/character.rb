class Character < ApplicationRecord
  belongs_to :encounter

  after_create_commit { CharacterCreateBroadcastJob.perform_later self }
  after_update_commit { CharacterUpdateBroadcastJob.perform_later self }
  after_destroy_commit { CharacterDestroyBroadcastJob.perform_later(encounter_id: self.encounter_id, id: self.id, name: self.name) }
end
