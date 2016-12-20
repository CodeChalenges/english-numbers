require_relative 'version'
require_relative 'mapping'

class EnglishNumber
  def initialize(number)
    @number = number
  end

  def to_english
    case @number
    when (-19..19)
      non_regular_number(@number)

    when (20..99), (-99..-20)
      regular_number(@number)
    end
  end

  def self.version
    English::Number::VERSION
  end

  protected

  def negative_string(number)
    number < 0 ? 'minus ' : nil
  end

  def non_regular_number(number)
    "#{negative_string(number)}#{English::Number::Mapping::NON_REGULAR_NUMBERS[number.abs]}"
  end

  def regular_number(number)
    dozens = number.abs / 10
    units = number.abs - dozens * 10

    dozens_string = English::Number::Mapping::DOZENS[dozens]
    units_string = units > 0 ? "-#{English::Number::Mapping::NON_REGULAR_NUMBERS[units]}" : nil

    "#{negative_string(number)}#{dozens_string}#{units_string}"
  end
end
