require 'rest_client'
require 'json'
require 'ostruct'

require "duder/version"
require "duder/exceptions"
require 'duder/resource'
require 'duder/associations'
require 'duder/base'
require 'duder/accessory'
require 'duder/character'

module Duder
  module Settings
    extend self

    def parameter *names
      names.each do |name|
        attr_accessor name

        define_method name do |*values|
          value = values.first
          value ? self.send("#{name}=", value) : instance_variable_get("@#{name}")
        end
      end
    end

    def configure &block
      instance_eval &block
    end
    alias_method :config, :configure
  end

  Settings.configure do
    parameter :api_key
  end
end
