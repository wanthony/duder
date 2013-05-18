module Duder
  module Associations
    module ClassMethods
      def has_many relation, options = {}
        alias_method "old_#{relation}", relation

        define_method relation do
          if instance_variable_defined?("@#{relation}")
            instance_variable_get("@#{relation}")
          else
            klass = Duder.const_get options[:class_name].to_s.capitalize
            objects = []

            send("old_#{relation}").each do |object|
              objects << klass.new(object, false)
            end

            instance_variable_set("@#{relation}", objects)
          end
        end
      end
    end

    module InstanceMethods

    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end
