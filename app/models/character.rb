class Character < ApplicationRecord
  after_create_commit { CharacterCreateBroadcastJob.perform_later self }
  after_update_commit { CharacterUpdateBroadcastJob.perform_later self }
  # after_destroy_commit { CharacterDestroyBroadcastJob.perform_later self.id }
end
