module Duder
  [
    [:InvalidApiKeyError, "Invalid API Key"],
    [:ObjectNotFoundError, "Object not found"],
    [:UrlFormatError, "Error in URL format"],
    [:JsonpFormatError, "'jsonp' format requires a 'json_callback' argument"],
    [:FilterError, "Filter error"],
    [:SubscriberOnlyError, "Subscriber only video is for subscribers only"]
  ].each do |exception_and_message|
    class_name = exception_and_message[0]
    message = exception_and_message[1]

    klass = Class.new(StandardError) do
      def initialize(msg = message)
        super(msg)
      end
    end

    Duder.const_set(class_name, klass)
  end

  class Exceptions
    EXCEPTION_FOR_CODE = {
      "100" => InvalidApiKeyError,
      "101" => ObjectNotFoundError,
      "102" => UrlFormatError,
      "103" => JsonpFormatError,
      "104" => FilterError,
      "105" => SubscriberOnlyError
    }

    def self.exception_for_response_code code
      EXCEPTION_FOR_CODE[code.to_s]
    end
  end
end
