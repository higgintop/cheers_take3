require_relative '../helper'
require_relative '../../lib/cheer'

class TestCheer < Minitest::Test

  def test_for_person_with_valid_name
    actual = Cheer.for_person("Ed")
    expected = ""
    expected << "Give me an.. E!\n" +
                "Give me a... D!\n" +
                "Ed's just GRAND!\n"
    assert_equal expected, actual
  end

  def test_for_person_with_name_with_spaces
    fail
  end

  def test_for_person_with_name_thats_blank
    fail
  end

  def test_for_person_with_name_thats_all_whitespace
    fail
  end

  def test_for_person_with_name_containing_hyphen
    fail
  end

  def test_for_person_with_name_containing_non_word_chars
    fail
  end

end
