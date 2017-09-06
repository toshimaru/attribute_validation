# frozen_string_literal: true

module AttributeValidation
  # Attribute validation methods for `ActiveRecord::Validations` module
  module Validations
    def valid_attributes?(*attr_names, **options)
      valid?(options[:context])
      attributes = attr_names.flatten.map(&:to_s)
      errors.keys.each do |key|
        errors.delete(key) unless attributes.include?(key.to_s)
      end
      errors.empty?
    end

    alias validate_attributes valid_attributes?
  end
end
