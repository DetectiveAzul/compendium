require_relative('../learning')
require('minitest/autorun')
require('minitest/rg')

class TestLearning < MiniTest::Test
  def setup()
    @learning = Learning.new({ 'spell_id' => 1, 'spellbook_id' => 1})
  end

  def test_spell_repeated()
    result = @learning.spell_repeated?()
    assert_equal(false, result)
  end
end
