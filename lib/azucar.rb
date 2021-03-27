# frozen_string_literal: true

require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.setup

module Azucar
  class Error < StandardError; end
  # Your code goes here...
end

# module Chatty
#   def self.method_added(method_name)
#     puts "Adding #{method_name.inspect}"
#   end
#   def self.some_class_method()
#     puts 'some_class_method'
#   end
#   def some_instance_method()
#     puts 'some_instance_method'
#   end
# end

# module Chatty
#   def freezer_instance_method() end
# end

# class Chatter
#   extend Chatty
# end

# # Chatty.some_class_method
# # Chatty.some_instance_method
# # Chatter.new().some_instance_method # works with 'include'
# Chatter.some_instance_method # works with 'extend'
