require_relative('../character')
require('minitest/autorun')
require('minitest/rg')

class TestSpellbook < MiniTest::Test
  def setup()
    @characters = Character.all()
    @character = @characters.first
  end

  def test_spellbooks()
    result = @character.spellbooks()
    assert_equal("Gul'dan", @character.name)
    assert_equal(2, result.count)
  end

  def test_spell_count()
    result = @character.spells_count()
    assert_equal("Gul'dan", @character.name)
    assert_equal(2, result)
  end

  def test_spells()
    result = @character.spells()
    assert_equal(2, result.count)
  end
end
