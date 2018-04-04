#This class just stores static information for dropdown menus
class FixedChoices
  def self.classes()
    return classes_array = [
      "Bard",
      "Cleric",
      "Druid",
      "Paladin",
      "Ranger",
      "Sorcerer",
      "Warlock",
      "Wizard"
    ]
  end

  def self.schools()
    return school_array = [
      "Abjuration",
      "Conjuration",
      "Divination",
      "Enchantment",
      "Evocation",
      "Illusion",
      "Necromancy",
      "Transmutation"
    ]
  end
end
