# AttributeValidation

[![Build Status](https://travis-ci.org/toshimaru/attribute_validation.svg?branch=master)](https://travis-ci.org/toshimaru/attribute_validation)
[![Gem Version](https://badge.fury.io/rb/attribute_validation.svg)](https://badge.fury.io/rb/attribute_validation)

ActiveRecord/ActiveModel extension which enables validate the specific attributes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'attribute_validation'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install attribute_validation

## Usage

```rb
class User < ActiveRecord::Base
  validates :name, presence: true
  validates :age, numericality: true
end

user = User.new(name: "toshimaru")
user.valid? # => false
user.errors.messages # => {:age=>["is not a number"]}

user.valid_attributes? :name # => true
user.errors.messages # => {}

user.valid_attributes? :name, :age # => false
user.errors.messages # => {:age=>["is not a number"]}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/toshimaru/attribute_validation.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
