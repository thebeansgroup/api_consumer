require 'active_resource'

module ApiConsumer
  module Parsers
    class Collection < ::ActiveResource::Collection
      attr_accessor :response

      def initialize(parsed = {})
        @elements = parsed.fetch('response')
        parsed.delete 'response'
        @response = parsed
      end
    end
  end
end
