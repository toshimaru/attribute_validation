# frozen_string_literal: true

require 'active_model'
require 'active_record'

require 'attribute_validation/validations'
require 'attribute_validation/version'

module ActiveRecord::Validations
  include AttributeValidation::Validations
end
