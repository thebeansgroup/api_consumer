module ApiConsumer
  module ErrorHandler
    def find(*attributes)
      scope = attributes.slice(0)
      if scope == :all
        begin
          super(*attributes)
        rescue ActiveResource::ConnectionError, ActiveResource::ClientError
          []
        end
      else
        super(*attributes)
      end
    end
  end
end
