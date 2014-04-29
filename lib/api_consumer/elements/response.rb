module ApiConsumer
  module Elements
    class Response
      def add_attribute(attr)
        self.class.send(:define_method, "#{attr}=".to_sym) { |v| instance_variable_set "@#{attr}", v  }
        self.class.send(:define_method, attr.to_sym) { instance_variable_get "@#{attr}" }
      end
    end
  end
end
