require 'spec_helper'
require_relative 'test_cases'

describe EnglishNumber do
  context 'positive numbers' do
    it do
      TEST_CASES.each do |number, expected_translation|
        expect(EnglishNumber.new(number).in_english).to eq(expected_translation)
      end
    end
  end

  context 'negative numbers' do
    it do
      TEST_CASES.each do |number, expected_translation|
        expect(EnglishNumber.new(-number).in_english).to eq("minus #{expected_translation}")
      end
    end
  end

  context 'special cases' do
    it do
      SPECIAL_TEST_CASES.each do |number, expected_translation|
        expect(EnglishNumber.new(number).in_english).to eq(expected_translation)
      end
    end
  end

  context 'version' do
    it { expect(EnglishNumber.version).to eq(English::Number::VERSION) }
  end
end
