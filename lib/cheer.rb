#!/usr/bin/env ruby

require_relative 'birthday_parser'


class Cheer
  AN_LETTERS = "HALFNORSEMIX"


  def self.for_birthday(birthday)
    today = Time.new.yday
    next_birthday = BirthdayParser.parse(birthday)
    if next_birthday.nil?
      raise ArgumentError
    else
      next_birthday = next_birthday.yday
    end
    difference = next_birthday - today

    if difference < 0
      # birthday already occurred
      difference = ((365-today) + next_birthday)
    end

    case difference
    when 0
      # Today is their birthday
      return "Awesome! Your birthday is today! Happy Birthday!"
    when 1
      #Use the singular?
      return "Awesome! Your birthday is in 1 day! Happy Birthday in advance!"
    else
      #Use the plural?
      return "Awesome! Your birthday is in #{difference.to_s} days! Happy Birthday in advance!"
    end
  end





  def self.for_person(name)
    name.chomp!
    adjusted_name = name.upcase.gsub(/[^A-Z]*/,'')
    raise ArgumentError if adjusted_name.empty?
    output = ""
    adjusted_name.each_char do |char|
      article = (AN_LETTERS.include? char) ? "an.." : "a..."
      output << "Give me #{article} #{char}!\n"
    end
    output + "#{name}'s just GRAND!"
  end
end
