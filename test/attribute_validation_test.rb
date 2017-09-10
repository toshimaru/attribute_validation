require 'test_helper'

class AttributeValidationTest < Minitest::Test
  def test_default_model_is_invalid
    user = User.new
    refute user.valid?
    assert_equal user.errors.messages.keys, [:name, :age]
  end

  def test_model_is_valid_with_valid_attributes
    user = User.new(name: 'toshi', age: 1)
    assert user.valid?
    assert_empty user.errors.messages
  end

  def test_valid_attributes_with_invalid_model
    user = User.new

    refute user.valid_attributes? :name
    assert_equal user.errors.messages.keys, [:name]

    refute user.valid_attributes? :age
    assert_equal user.errors.messages.keys, [:age]
  end

  def test_valid_attributes_with_valid_model
    user = User.new(name: 'toshi', age: 1)

    assert user.valid_attributes? :name
    assert_empty user.errors.messages

    assert user.valid_attributes? :age
    assert_empty user.errors.messages
  end
end
