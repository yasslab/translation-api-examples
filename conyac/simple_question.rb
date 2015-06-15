require 'json'
require 'shellwords'

published_scope_public = 0
published_scope_nonpublic = 2

params = {
  organization_id:        ENV['CONYAC_ORGANIZATION_ID'],
  language_id:            'en',
  translated_language_id: 'ja',
  description:            '',
  published_scope:        published_scope_nonpublic,
  escape_text:            0,
  text_format:            0,
  question_bodies: [
    {
      body: <<BODY
We’ll develop the sample app using a combination of mockups, test-driven development (TDD), and integration tests. We’ll get started in Chapter 3 by creating static pages and then add a little dynamic content.
BODY
    }
  ],
  access_token: '$CONYAC_ACCESS_TOKEN',
}

puts "curl -i -H 'Accept: application/json' -H 'Content-type: application/json' -X POST https://biz.conyac.cc/api/v1/simple/questions -d #{JSON.dump(params).shellescape}"
