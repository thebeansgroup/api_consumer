module ApiConsumer
  class Processor
    class << self
      def process(data, namespace)
        response = Elements::Response.new
        data.each do |key, item|
          parser = ParserRegistry.parser_for key, namespace
          unless parser.nil?
            response.add_attribute key
            response.send "#{key}=", parser.parse(item)
          end
        end
        response
      end
    end
  end
end
