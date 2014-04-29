module ApiConsumer
  module Parser

    class << self
      def parse(data)
        data.map do |key, item|
          parser = ParserRegistry.find_parser_for key
          parser.load item
        end
      end
    end
  end
end
