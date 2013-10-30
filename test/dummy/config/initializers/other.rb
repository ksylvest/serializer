Dummy::Application.config.session_store :cookie_store, :key => '_dummy_session'
Dummy::Application.config.secret_key_base = '5ff1ed532fd6db8b9fb92261d486fa553599eb7e5633c347438a38a913e11c0a5f5f8e3e6d3379e496a6b4e98c5f27d3146fdc4a3367882a8b502180c3ea1dc1'

ActiveSupport.on_load(:action_controller) do
  wrap_parameters :format => [:json] if respond_to?(:wrap_parameters)
end

Rails.application.config.filter_parameters += [:password]
