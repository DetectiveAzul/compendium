require_relative('../models/spell')

Spell.delete_all()

spell01_hash = {
  'name' => 'Acid Splash',
  'c_class' => ['Sorcerer', 'Wizard']
}
