module ApiConsumer
  module Elements
    Pagination = Struct.new(:page, :limit) do

      def initialize(attributes)
        attributes.each { |k, v| send("#{k}=", v) if respond_to?("#{k}=") }
      end

    end
  end
end
