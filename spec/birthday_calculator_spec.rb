require 'birthday_calculator'

RSpec.describe BirthdayCalculator do
  describe 'days_to_next_birthday' do
    current_date = DateTime.now

    context 'birthaday after curren date' do
      my_birthday = DateTime.new(current_date.year - 30,
                               current_date.month,
                               current_date.day + 1,
                               current_date.hour,
                               current_date.min,
                               current_date.sec)

      birthday_calculator = BirthdayCalculator.new(my_birthday)

      it 'returns time left to birthday' do
        expect(birthday_calculator.days_to_next_birthday)
          .to eq("It's left 0 days, 23 hours and 59 minutes to your birthday!")
      end
    end

    context 'birthaday before curren date' do
      my_birthday = DateTime.new(current_date.year - 30,
                                 current_date.month,
                                 current_date.day - 1,
                                 current_date.hour,
                                 current_date.min,
                                 current_date.sec)
  
      birthday_calculator = BirthdayCalculator.new(my_birthday)
  
      it 'returns time left to birthday' do
        expect(birthday_calculator.days_to_next_birthday)
          .to eq("It's left 363 days, 23 hours and 59 minutes to your birthday!")
      end
    end
  end
end