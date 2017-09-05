# frozen_string_literal: true

require 'active_model'
require 'active_record'

require 'attribute_validation/version'
require 'attribute_validation/validations'

module ActiveRecord::Validations
  include AttributeValidation::Validations
end
