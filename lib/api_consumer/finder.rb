module ApiConsumer
  module Finder
    def find(*attributes)
      super(*attributes)
    rescue ActiveResource::ConnectionError, ActiveResource::ClientError => e
      if attributes.first == :all
        ActiveResource::Collection.new
      else
        raise e
      end
    end
  end
end
