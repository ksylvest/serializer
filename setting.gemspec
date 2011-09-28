# -*- encoding: utf-8 -*-
$:.push File.join(File.dirname(__FILE__), 'lib')
require "serializer/version"

Gem::Specification.new do |s|
  s.name        = "serializer"
  s.version     = Serializer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Kevin Sylvestre"]
  s.email       = ["kevin@ksylvest.com"]
  s.homepage    = "http://github.com/ksylvest/serializer"
  s.summary     = "A serialized attribute accessor gem with support for types and defaults"
  s.description = "Serializer is a Ruby on Rails tool for adding accessor to serialized attributes with support for types and defaults."
  s.files       = Dir.glob("{bin,lib}/**/*") + %w(README.rdoc LICENSE Gemfile Rakefile)
end
