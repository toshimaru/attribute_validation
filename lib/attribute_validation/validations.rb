# frozen_string_literal: true

module AttributeValidation
  module Validations
    def valid_attributes?(*attr_names)
      valid?
      cols = attr_names.flatten.map(&:to_s)
      errors.delete_if { |key, _| !cols.include?(key) }
      errors.empty?
    end

    alias validate_attributes valid_attributes?
  end
end
