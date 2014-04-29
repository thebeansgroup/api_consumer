module ApiConsumer
  module Elements
    Order = Struct.new :order_by do
      def initialize(attributes)
        attributes.each { |k, v| send("#{k}=", v) if respond_to?("#{k}=") }
      end

      def to_s
        self.order_by
      end
    end
  end
end
