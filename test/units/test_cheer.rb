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
    actual = Cheer.for_person("Mary Jane")
    expected = ""
    expected << "Give me an.. M!\n" +
                "Give me an.. A!\n" +
                "Give me an.. R!\n" +
                "Give me a... Y!\n" +
                "Give me a... J!\n" +
                "Give me an.. A!\n" +
                "Give me an.. N!\n" +
                "Give me an.. E!\n" +
                "Mary Jane's just GRAND!\n"
    assert_equal expected, actual
  end

  def test_for_person_with_name_thats_blank
    actual =  Cheer.for_person("")
    expected = ""
    expected << "I'd cheer for you, if only I knew who you were :(\n"
    assert_equal expected, actual
  end

  def test_for_person_with_name_thats_all_whitespace
    actual =  Cheer.for_person("     ")
    expected = ""
    expected << "I'd cheer for you, if only I knew who you were :(\n"
    assert_equal expected, actual
  end

  def test_for_person_with_name_containing_hyphen
    actual = Cheer.for_person("Mary-Jane")
    expected = ""
    expected << "Give me an.. M!\n" +
                "Give me an.. A!\n" +
                "Give me an.. R!\n" +
                "Give me a... Y!\n" +
                "Give me a... J!\n" +
                "Give me an.. A!\n" +
                "Give me an.. N!\n" +
                "Give me an.. E!\n" +
                "Mary-Jane's just GRAND!\n"
    assert_equal expected, actual
  end

  def test_for_person_with_name_containing_non_word_chars
    actual =  Cheer.for_person("123#%")
    expected = ""
    expected << "I'd cheer for you, if only I knew who you were :(\n"
    assert_equal expected, actual
  end

  def test_for_birthday_with_valid_bday
    actual = Cheer.for_birthday("05/06")
    expected = "Awesome! Your birthday is in 1 day! Happy Birthday in advance!\n"
    assert_equal expected, actual
  end

  def test_for_birthday_with_invalid_bday
    actual = Cheer.for_birthday("33/02")
    expected =  "I'm sorry, I don't understand :( Try again next time.\n"
    assert_equal expected, actual
  end


end
