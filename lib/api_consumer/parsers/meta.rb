module ApiConsumer
  module Parsers
    class Meta < Base
    end
  end
end

ParserRegistry.register 'meta', Meta
