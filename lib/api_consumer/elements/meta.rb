module ApiConsumer
  module Elements
    class Meta < Struct.new(:code, :error_type, :error_message)

      def initialize(attributes)
        raise "Meta required a status code" unless attributes.has_key? 'code'
        attributes.each { |k, v| send("#{k}=", v) if respond_to?("#{k}=") }
      end

    end
  end
end
