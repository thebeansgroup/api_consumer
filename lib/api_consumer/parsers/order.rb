module ApiConsumer
  module Parsers
    class Order
      def self.parse(parsed = {})
        ApiConsumer::Elements::Order.new parsed
      end
    end
  end
end
