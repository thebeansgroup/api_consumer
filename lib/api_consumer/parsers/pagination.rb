module ApiConsumer
  module Parsers
    class Pagination
      def self.parse(parsed = {})
        ApiConsumer::Elements::Pagination.new parsed
      end
    end
  end
end
