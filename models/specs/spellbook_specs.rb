require_relative('../spellbook')
require('minitest/autorun')
require('minitest/rg')

class TestSpellbook < MiniTest::Test
  def setup()
    @spellbook1 = Spellbook.find(1)
  end

  def test_taking_learnings()
    result = @spellbook1.learnings()
    assert_equal(4, result.count())
  end

  def test_spell_count()
    result = @spellbook1.spells_count()
    assert_equal(4, result)
  end
end
