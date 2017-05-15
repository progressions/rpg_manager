class Character < ApplicationRecord
  belongs_to :encounter

  validates :name, presence: true
  validates :health, presence: true
  validates :max_health, presence: true
  validates :encounter, presence: true

  after_create_commit { CharacterCreateBroadcastJob.perform_later self }
  after_update_commit { CharacterUpdateBroadcastJob.perform_later self }

  before_validation { self.health ||= 0 }
  before_validation { self.max_health = self.health if max_health.blank? }

  scope :active, -> { where(active: true) }

  after_update do
    if self.saved_change_to_health?
      message = "#{self.name} now has #{self.health} health"
      Message.create! message_type: "system", encounter_id: self.encounter_id, body: message
    end
  end

  def deactivate!
    self.update_attributes!(active: false)
    CharacterDestroyBroadcastJob.perform_later(encounter_id: self.encounter_id, id: self.id, name: self.name)
  end
end
