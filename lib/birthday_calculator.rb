require 'time'
require 'date'
require 'active_support/all'

class BirthdayCalculator
  def initialize(date)
    @date = date
  end

  def days_to_next_birthday
    birthday_date =
      if @date.is_a?(DateTime)
        @date
      else
        DateTime.parse(@date)
      end

    current_date = DateTime.now
    
    current_birthday = modify_date(current_date.year,
                                   birthday_date.month,
                                   birthday_date.day,
                                   birthday_date.hour,
                                   birthday_date.min,
                                   birthday_date.sec)
    
    time_left = 
      if current_birthday - current_date >= 0
        current_birthday.utc - current_date.utc - Time.now.utc_offset
      else 
        modify_date(current_date.year + 1,
                    current_birthday.month,
                    current_birthday.day,
                    current_birthday.hour,
                    current_birthday.min,
                    current_birthday.sec).utc - current_date.utc - Time.now.utc_offset
      end

    mm, ss = time_left.divmod(60)
    hh, mm = mm.divmod(60)         
    dd, hh = hh.divmod(24)

    puts "It's left #{dd} days, #{hh} hours and #{mm} minutes to your birthday!"
    return "It's left #{dd} days, #{hh} hours and #{mm} minutes to your birthday!"
  end

  def modify_date(year, month, day, hour, min, sec) 
    begin
      DateTime.new(year, month, day, hour, min, sec)
    rescue ArgumentError
      for i in 1..4
        begin 
          return DateTime.new(year + i, month, day, hour, min, sec)
        rescue ArgumentError
          next
        end
      end
    end
  end
end
