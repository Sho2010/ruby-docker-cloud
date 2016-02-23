require 'docker_cloud/version'
require 'docker_cloud/base_api'
require 'docker_cloud/provider_api'
require 'docker_cloud/region_api'
require 'docker_cloud/availability_zone_api'

module DockerCloud
  class Client
    attr_reader :username, :api_key

    def initialize(username, api_key)
      @username = username
      @api_key = api_key
    end

    def headers
      {
          'Authorization' => authorization,
          'Accept' => 'application/json',
          'Content-Type' => 'application/json'
      }
    end

    def providers
      @providers ||= DockerCloud::ProviderAPI.new(headers)
    end

    def regions
      @regions ||= DockerCloud::RegionAPI.new(headers)
    end

    def availability_zones
      @availability_zones ||= DockerCloud::AvailabilityZoneAPI.new(headers)
    end

    private

    def authorization
      @auth ||= "Basic #{Base64.strict_encode64(@username + ':' + @api_key)}"
    end
  end
end