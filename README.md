[![Build Status](https://travis-ci.org/CodeChalenges/english-numbers.svg?branch=master)](https://travis-ci.org/CodeChalenges/english-numbers)
[![Code Climate](https://codeclimate.com/github/CodeChalenges/english-numbers/badges/gpa.svg)](https://codeclimate.com/github/CodeChalenges/english-numbers)
[![Issue Count](https://codeclimate.com/github/CodeChalenges/english-numbers/badges/issue_count.svg)](https://codeclimate.com/github/CodeChalenges/english-numbers)

# English Number

This gem provides an easy way to translate numbers to their English language representation.

## Setup

To install all necessary dependencies:

```sh
bundle install
```

## Tests

This gem uses Rspec as test framework. So, to run the specs:

```ruby
bundle exec rspec
```

## Installation

To build the gem:

```sh
gem build english-number.gemspec
```

After that, just install the gem:

```sh
gem install english-number-{gem version}.gem
```

## Usage

Inside Ruby interpreter:

```ruby
require 'english_number/english_number'

EnglishNumber.new(25).to_english # twenty-five
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
