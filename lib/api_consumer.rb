require 'api_consumer/version'
require 'api_consumer/parser_registry'
require 'api_consumer/processor'
require 'api_consumer/parsers/base'
require 'api_consumer/parsers/collection'
require 'api_consumer/parsers/meta'
require 'api_consumer/parsers/pagination'
require 'api_consumer/parsers/order'
require 'api_consumer/elements/response'
require 'api_consumer/elements/pagination'
require 'api_consumer/elements/order'
require 'api_consumer/elements/meta'
require 'api_consumer/attributes/base'
require 'api_consumer/finder'
require 'api_consumer/railtie' if defined?(Rails)

module ApiConsumer

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

  module Base
    module Initializer
      def initialize(attributes = {}, persisted = false)
        if Attributes::Base.new(attributes).standardized?
          attributes = attributes.fetch('data')
        end
        super attributes, persisted
      end
    end

    module ClassMethods
      include Finder
    end

    mattr_accessor :parser_registry

    def self.included(base)
      base.extend(ClassMethods)
      base.class_eval do
        base.collection_parser = Parsers::Collection
        base.send :prepend, Initializer
      end
    end
  end

  class Configuration
    attr_accessor :parser_registry

    def initialize
      self.parser_registry = ParserRegistry
    end

    def build_parser_registry(&block)
      yield self.parser_registry
    end
  end

end
