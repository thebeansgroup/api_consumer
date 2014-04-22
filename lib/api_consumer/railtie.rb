module ApiConsumer
  class Railtie < Rails::Railtie
    config.to_prepare do
      #ApiConsumer.setup!
    end
  end
end
