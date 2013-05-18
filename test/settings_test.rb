require "minitest/autorun"
require 'duder'

describe Duder::Settings do
  describe '#configure' do
    it "should allow the user to set an API key" do
      Duder::Settings.configure { api_key "abc" }

      assert_equal "abc", Duder::Settings.api_key
    end
  end
end
