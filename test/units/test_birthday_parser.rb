require_relative '../helper'
require_relative '../../lib/birthday_parser'

class TestBirthdayParser < Minitest::Test

  def test_parse_for_valid_birthday_a
    actual = BirthdayParser.parse("05/06")
    expected = "1"
    assert_equal expected, actual
  end

  def test_parse_for_valid_birthday_b
    actual = BirthdayParser.parse("05/07")
    expected = "2"
    assert_equal expected, actual
  end

  def test_parse_for_invalid_birthday
    actual = BirthdayParser.parse("33/01")
    expected = nil
    assert_equal expected, actual
  end

end
