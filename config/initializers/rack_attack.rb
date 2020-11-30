module Rack
  class Attack
    Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new
 
    # Allow all local traffic
    safelist('allow-localhost') do |req|
      req.ip == '127.0.0.1' || req.ip == '::1'
    end
 
    throttle('req/ip', limit: 100, period: 60, &:ip)
  end
end