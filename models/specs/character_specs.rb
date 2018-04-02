require_relative('../character')
require('minitest/autorun')
require('minitest/rg')

class TestSpellbook < MiniTest::Test
  def setup()
    @characters = Character.all()
    @character = @characters.first
  end

  def test_spellbooks
    result = @character.spellbooks()
    assert_equal("Gul'dan", @character.name)
    assert_equal(2, result.count)
  end
end
