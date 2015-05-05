#!/usr/bin/env ruby
require 'date'

class BirthdayParser

  def self.parse(birthday_str)
    todayYDay = Time.new.yday
    # 2. need user's yday conversion
    begin
      userYDay = Date.strptime(birthday_str, "%m/%d").yday
      if userYDay  >= todayYDay
        return (userYDay-todayYDay).to_s
      else
        return ((365-todayYDay) + userYDay).to_s
      end
    rescue
      return nil
    end
  end
end
