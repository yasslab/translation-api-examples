require 'json'
require 'shellwords'

params = {
  organization_id:        ENV['CONYAC_ORGANIZATION_ID'],
  language_id:            'en',
  translated_language_id: 'ja',
  questions: [
    {
      type:                   'string',
      body:                   <<BODY,
We’ll develop the sample app using a combination of mockups, test-driven development (TDD), and integration tests. We’ll get started in Chapter 3 by creating static pages and then add a little dynamic content.
BODY
    }
  ],
  access_token: '$CONYAC_ACCESS_TOKEN',
}

puts "curl -i -H 'Accept: application/json' -H 'Content-type: application/json' -X POST https://biz.conyac.cc/api/v1/projects -d #{JSON.dump(params).shellescape}"
