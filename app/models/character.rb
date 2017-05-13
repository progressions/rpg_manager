class Character < ApplicationRecord
  after_update_commit { CharacterUpdateBroadcastJob.perform_later self }
end
