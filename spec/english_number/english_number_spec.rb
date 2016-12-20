require 'spec_helper'

describe EnglishNumber do
  context 'non-regular positive numbers' do
    it do
      (0..19).each do |number|
        expect(EnglishNumber.new(number).to_english).to eq(English::Number::Mapping::BASE_NUMBERS[number])
      end
    end
  end

  context 'non-regular negative numbers' do
    it do
      (-19..-1).each do |number|
        expect(EnglishNumber.new(number).to_english).to eq("minus #{English::Number::Mapping::BASE_NUMBERS[number.abs]}")
      end
    end
  end

  context 'regular positive numbers' do
    it do
      (20..99).each do |number|
        dozens = number / 10
        units = number - dozens * 10

        dozens_string = English::Number::Mapping::DOZENS[dozens]
        units_string = units > 0 ? "-#{English::Number::Mapping::BASE_NUMBERS[units]}" : nil
        expect(EnglishNumber.new(number).to_english).to eq("#{dozens_string}#{units_string}")
      end
    end
  end

  context 'regular negative numbers' do
    it do
      (-99..-20).each do |number|
        dozens = number.abs / 10
        units = number.abs - dozens * 10

        dozens_string = English::Number::Mapping::DOZENS[dozens]
        units_string = units > 0 ? "-#{English::Number::Mapping::BASE_NUMBERS[units]}" : nil
        expect(EnglishNumber.new(number).to_english).to eq("minus #{dozens_string}#{units_string}")
      end
    end
  end
end
