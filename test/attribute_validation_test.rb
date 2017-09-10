require 'test_helper'
require 'pry'

class AttributeValidationTest < Minitest::Test
  def test_default_model_is_invalid
    user = User.new
    assert user.invalid?
    assert_equal user.errors.messages.keys, [:name, :age]
  end

  def test_model_is_valid_with_valid_attributes
    user = User.new(name: 'toshi', age: 1)
    assert user.valid?
    assert_empty user.errors.messages
  end
end
