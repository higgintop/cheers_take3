#!/usr/bin/env ruby

require_relative 'birthday_parser'


class Cheer

  def self.for_person(name)
    output = ""

    # remove whitespace
    nameModified = name.gsub(/\s+/, "")

    if nameModified.nil? or nameModified.empty?
      return "I'd cheer for you, if only I knew who you were :(\n"
    end

    # remove special characters from nameModified
    nameModified.gsub!(/[\d\W]/, "")

    if nameModified.empty?
      return "I'd cheer for you, if only I knew who you were :(\n"
    end

    an_letters = "AEFHILMNORSX"
    nameModified.each_char do |letter|
      if an_letters.include? letter.upcase
        output << "Give me an.. " + letter.upcase + "!\n"
      else
        output << "Give me a... " + letter.upcase + "!\n"
      end
    end

    output << "#{name.chomp}'s just GRAND!\n"
  end

  def self.for_birthday(birthday_str)
    # first parse the birthday_str
    num_days_until_bday = BirthdayParser.parse(birthday_str)

    if num_days_until_bday.nil?
      return "I'm sorry, I don't understand :( Try again next time.\n"
    else
      return "Awesome! Your birthday is in #{num_days_until_bday} day! Happy Birthday in advance!\n"
    end
  end

end
