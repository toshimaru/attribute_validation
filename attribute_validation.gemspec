# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "attribute_validation/version"

Gem::Specification.new do |spec|
  spec.name          = "attribute_validation"
  spec.version       = AttributeValidation::VERSION
  spec.authors       = ["toshimaru"]
  spec.email         = ["me@toshimaru.net"]

  spec.summary       = %q{Attributes Validation Extension for ActiveRecord/ActiveModel}
  spec.description   = %q{ActiveRecord/ActiveModel validation extension which enables attributes validation.}
  spec.homepage      = "https://github.com/toshimaru/attribute_validation"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel", "~> 4.2.0"
  spec.add_dependency "activerecord", "~> 4.2.0"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
