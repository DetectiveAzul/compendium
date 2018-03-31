require_relative('../models/spell')
require_relative('../models/spellbook')

Spell.delete_all()
Spellbook.delete_all()

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

spell01 = Spell.new(spell01_hash).save()
spell02 = Spell.new(spell02_hash).save()
spell03 = Spell.new(spell03_hash).save()
spell04 = Spell.new(spell04_hash).save()

spellbook01_hash = {
  "name" => "Level 1 Spellbook",
  "pages" => 100
}
spellbook02_hash = {
  "name" => "Level 2 Spellbook",
  "pages" => 50
}

spellbook01 = Spellbook.new(spellbook01_hash).save()
spellbook02 = Spellbook.new(spellbook02_hash).save()
