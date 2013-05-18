module Duder
  module Resource
    module ClassMethods
      def resource_reader *attributes
        attributes.each do |attr|
          define_method attr do
            if @loaded_data
              @attributes[attr.to_s]
            else
              get_data
              @attributes[attr.to_s]
            end
          end
        end
      end

      def find id, options = {}
        class_name = self.to_s.split('::').last.downcase

        url = "http://www.giantbomb.com/api/#{class_name}/#{id}"

        response = RestClient.get(url, params: { format: 'json', api_key: Duder::Settings.api_key }.merge(options))

        response = JSON.parse(response)

        if response["status_code"] != 1
          raise Duder::Exceptions.exception_for_response_code(response['status_code']).new
        else
          response["results"].keys.each do |key|
            response["results"][key] = OpenStruct.new(response["results"][key]) if response["results"][key].is_a?(Hash)
          end

          self.new response["results"]
        end
      end
    end

    module InstanceMethods
      def get_data
        class_name = self.class.to_s.split('::').last.downcase

        url = "http://www.giantbomb.com/api/#{class_name}/#{@attributes['id']}"

        response = RestClient.get(url, params: { format: 'json', api_key: Duder::Settings.api_key })

        response = JSON.parse(response)

        if response["status_code"] != 1
          raise Duder::Exceptions.exception_for_response_code(response['status_code']).new
        else
          response["results"].keys.each do |key|
            response["results"][key] = OpenStruct.new(response["results"][key]) if response["results"][key].is_a?(Hash)
          end

          @attributes = response["results"]
          @loaded_data = true
        end
      end
      private :get_data
    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods

      receiver.send :resource_reader, :api_detail_url, :image, :name, :site_detail_url, :deck, :date_added, :date_last_updated, :description, :id
    end
  end
end
