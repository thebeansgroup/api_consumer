module ApiConsumer
  class Railtie < Rails::Railtie
    config.to_prepare do
      #ApiConsumer.setup!
    end

    initializer "api_consumer.configure_default_parsers" do |app|
      ApiConsumer.configure do |config|
        config.build_parser_registry do |reg|
          reg.register 'meta', Parsers::Meta
        end
      end
    end
  end
end
