module ApiConsumer
  class ParserRegistry

    DEFAULT_NAMESPACE = :root

    class_attribute :registered_parsers

    self.registered_parsers = {}

    class << self

      def registered
        self.registered_parsers
      end

      def registered?(name, namespace = DEFAULT_NAMESPACE)
        raise "No such namespace '#{namespace}" unless has_namespace?(namespace)
        self.registered_parsers[namespace].has_key? name
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
    end
  end
end
