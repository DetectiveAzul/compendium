require_relative('../models/spell')
require_relative('../models/spellbook')
require_relative('../models/learning')
require_relative('../models/character')
require_relative('../models/spell_slot')

# Delete everything from the DB to avoid duplicates
Learning.delete_all()
Spell.delete_all()
Spellbook.delete_all()
SpellSlot.delete_all()
Character.delete_all()

# Creation and saving of the spells on the DB

spell01_hash = {
  'name' => 'Acid Splash',
  'school' => 'Conjuration',
  'level' => 0,
  'pages' => 1,
  'description' => 'You hurl a bubble of acid. Choose one creature within range, or choose two creatures within range that are within 5 feet of each other. A target must succeed on a Dexterity saving throw or take 1d6 acid damage. This spell’s damage increases by 1d6 when you reach 5th level (2d6), 11th level (3d6), and 17th level (4d6).'
}
spell02_hash = {
  'name' => 'Blade Ward',
  'school' => 'Necromancy',
  'level' => 0,
  'pages' => 1,
  'description' => "You create a ghostly, skeletal hand in the space of a creature within range. Make a ranged spell attack against the creature to assail it with the chill of the grave. On a hit, the target takes 1d8 necrotic damage, and it can't regain hit points until the start of your next turn. Until then, the hand clings to the target. If you hit an undead target, it also has disadvantage on attack rolls against you until the end of your next turn. This spell's damage increases by 1d8 when you reach 5th level (2d8), 11th level (3d8), and 17th level (4d8)."
}
spell03_hash = {
  'name' => 'Fire Bolt',
  'school' => 'Evocation',
  'level' => 1,
  'pages' => 1,
  'description' => "You hurl a mote of fire at a creature or object within range. Make a ranged spell attack against the target. On a hit, the target takes 1d10 fire damage. A flammable object hit by this spell ignites if it isn't being worn or carried. This spell's damage increases by 1d10 when you reach 5th level (2d10), 11th level (3d10), and 17th level (4d10)."
}
spell04_hash = {
  'name' => 'Magic Stone',
  'school' => 'Transmutation',
  'level' => 1,
  'pages' => 1,
  'description' => "You touch one to three pebbles and imbue them with magic. You or someone else can make a ranged spell attack with one of the pebbles by throwing it or hurling it with a sling. If thrown, it has a range of 60 feet. If someone else attacks with the pebble, that attacker adds your spellcasting ability modifier, not the attacker’s, to the attack roll. On a hit, the target takes bludgeoning damage equal to 1d6 + your spellcasting ability modifier. Hit or miss, the spell then ends on the stone. If you cast this spell again, the spell ends early on any pebbles still affected by it."
}

spell01 = Spell.new(spell01_hash)
spell02 = Spell.new(spell02_hash)
spell03 = Spell.new(spell03_hash)
spell04 = Spell.new(spell04_hash)

spell01.save()
spell02.save()
spell03.save()
spell04.save()

# Creation and saving of the characters on the DB
character01_hash = {
  'name' => 'Valtek',
  'level' => 1,
  'c_class' => 'Bard',
  'writing_skill' => 2
}

character02_hash = {
  'name' => "Gul'dan",
  'level' => 2,
  'c_class' => 'Warlock',
  'writing_skill' => 2
}

character01 = Character.new(character01_hash)
character02 = Character.new(character02_hash)

character01.save()
character02.save()

# Creation and saving of the spell slots (for future extension) on the DB
spellslot01 = SpellSlot.new({
  'character_id' => character01.id,
  'level' => 1,
  'quantity' => 2
   })
spellslot02 = SpellSlot.new({
  'character_id' => character02.id,
  'level' => 1,
  'quantity' => 4
   })
spellslot03 = SpellSlot.new({
  'character_id' => character02.id,
  'level' => 2,
  'quantity' => 2
   })

spellslot01.save()
spellslot02.save()
spellslot03.save()

# Creation and saving of the spellbooks on the DB
spellbook01_hash = {
  "name" => "Level 1 Spellbook",
  "pages" => 100,
  "character_id" => character01.id
}
spellbook02_hash = {
  "name" => "Level 2 Spellbook",
  "pages" => 50,
  "character_id" => character02.id
}
spellbook03_hash = {
  "name" => "Level 1 Spellbook",
  "pages" => 75,
  "character_id" => character02.id
}

spellbook01 = Spellbook.new(spellbook01_hash)
spellbook02 = Spellbook.new(spellbook02_hash)
spellbook03 = Spellbook.new(spellbook03_hash)

spellbook01.save()
spellbook02.save()
spellbook03.save()

# Creation and saving of the learnings (conection between spell and book) on the DB
learning01 = Learning.new( {'spell_id' => spell01.id,'spellbook_id' => spellbook01.id } )
learning02 = Learning.new( {'spell_id' => spell02.id,'spellbook_id' => spellbook01.id } )
learning03 = Learning.new( {'spell_id' => spell03.id,'spellbook_id' => spellbook01.id } )
learning04 = Learning.new( {'spell_id' => spell04.id,'spellbook_id' => spellbook01.id } )
learning05 = Learning.new( {'spell_id' => spell03.id,'spellbook_id' => spellbook02.id } )
learning06 = Learning.new( {'spell_id' => spell04.id,'spellbook_id' => spellbook02.id } )

learning01.save()
learning02.save()
learning03.save()
learning04.save()
learning05.save()
learning06.save()
