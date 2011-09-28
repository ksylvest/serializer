require 'serializer/railtie'
require 'serializer/initializer'

module Serializer  
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    
    # Add serializer to a class.
    #
    # Usage:
    #
    #   has_serialized :settings do |settings|
    #     settings.define :tw_share, default: true, type: :boolean
    #     settings.define :fb_share, default: true, type: :boolean
    #   end
    #
    
    def has_serialized(name, &block)
      serialize name, Hash
      
      initializer = Serializer::Initializer.new
      block.call(initializer)
      
      initializer.each do |method, options|
        
        define_method "#{method}" do
          result = send(name)[method.intern]
          return options[:default] if result.nil?
          return result
        end
        
        define_method "#{method}?" do
          result = send(name)[method.intern] 
          return options[:default] if result.nil?
          return result
        end
        
        define_method "#{method}=" do |value|
          if options[:type] and value
            case options[:type].intern
            when :float   then value = value.to_f if value.respond_to? :to_f
            when :integer then value = value.to_i if value.respond_to? :to_i
            when :string  then value = value.to_str if value.respond_to? :to_str
            when :symbol  then value = value.to_sym if value.respond_to? :to_sym
            when :boolean then value = !value.to_i.zero? if value.respond_to? :to_i
            end
          end
          
          send(name)[method.intern] = value
        end
        
      end
    end
    
  end
  
end