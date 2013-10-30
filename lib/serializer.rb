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
          hash = send(name)
          result = hash[method.to_sym] if hash

          if hash.nil? or result.nil?
            send("#{name}=", {}) unless send(name)
            hash = send(name)

            result = options[:default]
            result = result.clone if result.duplicable?

            hash[method.to_sym] = result
          end

          return result
        end

        define_method "#{method}?" do
          hash = send(name)
          result = hash[method.to_sym] if hash

          if hash.nil? or result.nil?
            send("#{name}=", {}) unless send(name)
            hash = send(name)

            result = options[:default]
            result = result.clone if result.duplicable?

            hash[method.to_sym] = result
          end

          return result
        end

        define_method "#{method}=" do |value|
          original = send(name) || {}

          if options[:type] and value
            case options[:type].to_sym
            when :float   then value = value.to_f if value.respond_to? :to_f
            when :integer then value = value.to_i if value.respond_to? :to_i
            when :string  then value = value.to_str if value.respond_to? :to_str
            when :symbol  then value = value.to_sym if value.respond_to? :to_sym
            when :boolean then
              value = true  if value.eql? "true"
              value = false if value.eql? "false"
              value = !value.to_i.zero? if value.respond_to? :to_i
            end
          end

          modified = original.clone
          modified[method.to_sym] = value

          send("#{name}_will_change!") unless modified.eql?(original)
          send("#{name}=", modified)
        end

      end
    end

  end

end