require 'active_support'
require 'active_support/core_ext'

authorize_url = 'https://biz.conyac.cc/oauth/authorize'

params = {
  response_type: 'code',
  client_id: ENV['CONYAC_APP_ID'],
  redirect_uri: 'http://localhost:3000/'
}

puts authorize_url + '?' + params.to_query
