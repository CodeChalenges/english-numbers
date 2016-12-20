require_relative "version"
require_relative "mapping"

class EnglishNumber
  def initialize(number)
    @original = number
    @dozens = number.abs / 10
    @units = @original.abs - @dozens * 10
  end

  def to_english
    case @original
      when (-19..19)
        non_regular_number((@original < 0), @original.abs)

      when (20..99), (-99..-20)
        regular_number((@original < 0), @dozens, @units)

      else
        nil
    end
  end

  def negative_string(is_negative)
    is_negative ? 'minus ' : nil
  end

  def non_regular_number(is_negative, original_absolute)
    "#{negative_string(is_negative)}#{English::Number::Mapping::BASE_NUMBERS[original_absolute]}"
  end

  def regular_number(is_negative, dozens, units)
    dozens_string = English::Number::Mapping::DOZENS[dozens]
    units_string = units > 0 ? "-#{English::Number::Mapping::BASE_NUMBERS[units]}" : nil
    "#{negative_string(is_negative)}#{dozens_string}#{units_string}"
  end

  def self.version
    English::Number::VERSION
  end
end
