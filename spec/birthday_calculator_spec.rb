require 'birthday_calculator'
require 'timecop'

RSpec.describe BirthdayCalculator do
  describe 'days_to_next_birthday' do
    Timecop.travel(Time.new(2020, 9, 20, 10))

    context 'birthday after curren date' do
      birthday_calculator = BirthdayCalculator.new(DateTime.new(2000, 9, 21, 10))

      it 'returns time left to birthday' do
        expect(birthday_calculator.days_to_next_birthday.days).to eq(0)
        expect(birthday_calculator.days_to_next_birthday.hours).to eq(23)
        expect(birthday_calculator.days_to_next_birthday.minutes).to eq(59)
      end
    end

    context 'birthday before curren date' do  
      birthday_calculator = BirthdayCalculator.new(DateTime.new(2000, 9, 19, 10))
  
      it 'returns time left to birthday' do
        expect(birthday_calculator.days_to_next_birthday.days).to eq(363)
        expect(birthday_calculator.days_to_next_birthday.hours).to eq(23)
        expect(birthday_calculator.days_to_next_birthday.minutes).to eq(59)
      end
    end

    context 'with date as string' do 
      birthday_calculator = BirthdayCalculator.new('23-09-2020')
  
      it 'returns time left to birthday' do
        expect(birthday_calculator.days_to_next_birthday.days).to eq(2)
        expect(birthday_calculator.days_to_next_birthday.hours).to eq(13)
        expect(birthday_calculator.days_to_next_birthday.minutes).to eq(59)
      end
    end

    context 'account for leap year' do
      birthday_calculator = BirthdayCalculator.new(DateTime.new(2000, 2, 29, 11))
  
      it 'returns time left to birthday' do
        expect(birthday_calculator.days_to_next_birthday.days).to eq(1257)
        expect(birthday_calculator.days_to_next_birthday.hours).to eq(0)
        expect(birthday_calculator.days_to_next_birthday.minutes).to eq(59)
      end
    end
  end
end