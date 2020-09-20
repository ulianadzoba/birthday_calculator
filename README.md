`basic_calculator` is a Ruby gem which calculate time left to your birthday.

## Installation

Gemfile:

```ruby
gem 'birthday_calculator', '~> 0.0.1'
```

Run:

  $ bundle install

## Usage

Create an instance of `BirthdayCalculator`, which accepts your birthday date as string or `DateTime` object.

Use method `days_to_next_birthday` to calculate time left to your birthday. It returns `Struct` with keys `[:days, :hours, :minutes]`.

