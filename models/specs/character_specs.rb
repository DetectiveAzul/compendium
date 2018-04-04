require_relative('../character')
require('minitest/autorun')
require('minitest/rg')

class TestSpellbook < MiniTest::Test
  def setup()
    @character = Character.find(1)
  end

  def test_spellbooks()
    result = @character.spellbooks()
    assert_equal("Valtek", @character.name)
    assert_equal(1, result.count)
  end

  def test_spell_count()
    result = @character.spells_count()
    assert_equal("Valtek", @character.name)
    assert_equal(5, result)
  end

  def test_spells()
    result = @character.spells()
    assert_equal(5, result.count)
  end
end
