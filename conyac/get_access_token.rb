require 'active_support'
require 'active_support/core_ext'
require 'net/http'
require 'uri'

access_token_url = 'https://biz.conyac.cc/oauth/token'

params = {
  client_id:      ENV['CONYAC_APP_ID'],
  client_secret:  ENV['CONYAC_APP_SECRET'],
  redirect_uri:   'http://localhost:3000/',
  grant_type:     'authorization_code',
  code:           ARGV.first,

}

url = URI.parse(access_token_url)
req = Net::HTTP::Post.new(url.path)
req.set_form_data(params)
req['Accept'] = 'application/json'

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
res = http.start {|http| http.request(req) }
puts res.body
