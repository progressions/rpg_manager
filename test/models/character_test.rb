require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  test "requires name" do
    character = sample_character(name: nil, encounter_id: sample_encounter.id)
    assert !character.valid?
    assert_equal ["can't be blank"], character.errors[:name]
  end

  test "requires encounter" do
    character = sample_character(name: nil, encounter_id: nil)
    assert !character.valid?
    assert_equal ["must exist", "can't be blank"], character.errors[:encounter]
  end

  test "sets health to 0 if nil" do
    character = sample_character(health: nil, encounter_id: sample_encounter.id)
    assert character.valid?
    assert_equal 0, character.health
  end

  test "sets max health to health if nil" do
    character = sample_character(health: 30, encounter_id: sample_encounter.id)
    assert character.valid?
    assert_equal 30, character.health
    assert_equal 30, character.max_health
  end

  test "reset! sets health to max health" do
    character = sample_character(health: 30, encounter_id: sample_encounter.id)
    character.health -= 10
    character.reset!
    assert_equal character.max_health, character.health
  end

  def sample_character(name: "Bartholomew", health: 25, max_health: nil, encounter_id: nil)
    Character.new name: name, health: health, max_health: max_health, encounter_id: encounter_id
  end

  def sample_encounter(name: "Woods Ambush")
    Encounter.create! name: name, user: users(:one)
  end
end
