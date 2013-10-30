module Serializer

  class Initializer < Hash

    def define(name, options = {})
      self[name] = options
    end

  end

end