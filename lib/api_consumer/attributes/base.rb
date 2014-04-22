module ApiConsumer
  module Attributes
    class Base
      STANDARDIZATIONS_KEY = "meta"
      attr_accessor :attributes

      def initialize(attributes)
        self.attributes = attributes
      end

      def standardized?
        self.attributes.has_key? STANDARDIZATIONS_KEY
      end
    end
  end
end
