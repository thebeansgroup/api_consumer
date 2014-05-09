module ApiConsumer
  class ParserRegistry

    DEFAULT_NAMESPACE = :root

    class_attribute :registered_parsers

    self.registered_parsers = {}

    class << self

      def registered
        self.registered_parsers
      end

      # Return whether or not the namespace has a parser in the registry
      # with the given name
      def registered?(name, namespace = DEFAULT_NAMESPACE)
        registered = has_namespace? namespace
        if registered
          registered = self.registered_parsers[namespace].has_key? name
        end
        registered
      end

      def has_namespace?(namespace)
        self.registered_parsers.has_key? namespace
      end

      def registered_namespaces
        registered.keys
      end

      def register(name, parser, namespace = DEFAULT_NAMESPACE)
        self.registered_parsers[namespace] ||= {}
        registered[namespace][name] = parser
      end

      def parser_for(key, namespace = DEFAULT_NAMESPACE)
        return self.registered_parsers.fetch(namespace).fetch(key) if registered? key, namespace
        return self.registered_parsers.fetch(DEFAULT_NAMESPACE).fetch(key) if registered? key
      end
    end
  end
end
