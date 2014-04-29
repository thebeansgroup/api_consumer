module ApiConsumer
  module Parsers
    class Meta < Base
      def self.parse(parsed = {})
        ApiConsumer::Elements::Meta.new parsed
      end
    end
  end
end
