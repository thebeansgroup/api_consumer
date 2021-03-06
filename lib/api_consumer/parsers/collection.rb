require 'active_resource'

module ApiConsumer
  module Parsers
    class Collection < ::ActiveResource::Collection
      attr_accessor :response

      def initialize(parsed = {})
        @elements = parsed.fetch('data')
        parsed.delete 'data'
        @response = parsed
      end

      def collect!
        @response = ApiConsumer::Processor.process @response, resource_class.to_s
        super
      end
    end
  end
end
