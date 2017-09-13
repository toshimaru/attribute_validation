require 'test_helper'

module Activerecord
  class User < ActiveRecord::Base
    validates :name, presence: true
    validates :age, numericality: true
    validates :context_name, presence: true, on: :custom_context
  end

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

      assert user.valid_attributes? :context_name
      assert_empty user.errors.messages
    end

    def test_valid_attributes_with_invalid_model_using_multiple_args
      user = User.new
      user.valid_attributes? :name, :age, :context_name
      assert_equal user.errors.messages.keys, [:name, :age]
    end

    def test_context_valid_attributes_with_invalid_model_using_multiple_args
      user = User.new
      user.valid_attributes? :name, :age, :context_name, context: :custom_context
      assert_equal user.errors.messages.keys, [:name, :age, :context_name]
    end

    def test_valid_attributes_with_valid_model
      user = User.new(name: 'toshi', age: 1)

      assert user.valid_attributes? :name
      assert_empty user.errors.messages

      assert user.valid_attributes? :age
      assert_empty user.errors.messages

      assert user.valid_attributes? :context_name
      assert_empty user.errors.messages
    end

    def test_alias_method_with_valid_model
      user = User.new(name: 'foo', age: '2')

      assert user.validate_attributes :name
      assert_empty user.errors.messages

      assert user.validate_attributes :age
      assert_empty user.errors.messages
    end
  end
end
