module DockerCloud
  class RegionAPI < DockerCloud::BaseAPI
    def list_url(provider_region = '')
      puts "#{DockerCloud::DOCKER_CLOUD_API_VERSION}"
      "/api/infra/#{DockerCloud::DOCKER_CLOUD_API_VERSION}/region/#{provider_region}"
    end

    # Lists all regions of all supported cloud providers.
    # Returns a list of Region objects
    def list(params={})
      http_get(list_url, params)
    end

    # Gets all the details of a specific region for a specific provider
    # Returns a Region object
    def get_by_name(provider_name, region_name)
      provider_region = "#{provider_name}/#{region_name}"
      http_get(list_url(provider_region))
    end
  end
end