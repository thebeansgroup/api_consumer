module ApiConsumer
  module Parsers
    class Base
      def self.parse(attributes)
        raise "Not defined"
      end
    end
  end
end
