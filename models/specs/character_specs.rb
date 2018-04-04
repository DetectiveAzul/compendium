require_relative('../character')
require('minitest/autorun')
require('minitest/rg')

class TestSpellbook < MiniTest::Test
  def setup()
    @character = Character.find(1)
    @character2 = Character.find(6)
  end

  def test_spellbooks()
    result = @character.spellbooks()
    assert_equal("Valtek Morundil", @character.name)
    assert_equal(1, result.count)
  end

  def test_spell_count()
    result = @character.spells_count()
    assert_equal("Valtek Morundil", @character.name)
    assert_equal(4, result)
  end

  def test_spells()
    result = @character.spells()
    assert_equal(4, result.count)
  end

  def test_repeated_name()
    result = @character2.repeated_name?()
    assert_equal(false, result)
  end
end
