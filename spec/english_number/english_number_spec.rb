require 'spec_helper'
require_relative 'test_cases'

describe EnglishNumber do
  context 'positive numbers' do
    TEST_CASES.each do |number, expected_translation|
      it "should match '#{number}' to '#{expected_translation}'" do
        expect(EnglishNumber.new(number).in_english).to eq(expected_translation)
      end
    end
  end

  context 'negative numbers' do
    TEST_CASES.each do |number, expected_translation|
      it "should match '#{-number}' to 'minus #{expected_translation}'" do
        expect(EnglishNumber.new(-number).in_english).to eq("minus #{expected_translation}")
      end
    end
  end

  context 'special cases' do
    SPECIAL_TEST_CASES.each do |number, expected_translation|
      it "should match '#{number}' to '#{expected_translation}'" do
        expect(EnglishNumber.new(number).in_english).to eq(expected_translation)
      end
    end
  end

  context 'version' do
    it { expect(EnglishNumber.version).to eq(English::Number::VERSION) }
  end
end
