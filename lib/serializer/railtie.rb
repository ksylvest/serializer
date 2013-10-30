require 'serializer'
require 'rails'

module Serializer
  class Railtie < Rails::Railtie

    initializer 'serializer.initialize' do
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send :include, Serializer
      end
    end

  end
end