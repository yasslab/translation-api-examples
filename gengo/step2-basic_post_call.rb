require 'gengo'
require 'json'

gengo = Gengo::API.new(
  public_key:  ENV['GENGO_PUBLIC_KEY'],
  private_key: ENV['GENGO_PRIVATE_KEY'],
  sandbox:     true,
)

body_src=<<SRC
We’ll develop the sample app using a combination of mockups, test-driven development (TDD), and integration tests. We’ll get started in Chapter 3 by creating static pages and then add a little dynamic content.
SRC

job1 = {
    type:         'text',
    slug:         'job test 1',
    body_src:     body_src,
    lc_src:       'en',
    lc_tgt:       'ja',
    tier:         'standard',
    auto_approve: 1,
    custom_data:  'some custom data untouched by Gengo.',
}
job2 = {
    type:         'text',
    slug:         'job test 2',
    body_src:     body_src,
    lc_src:       'en',
    lc_tgt:       'ja',
    tier:         'pro',
    comment:      'This one has a comment',
}

puts JSON.dump(gengo.postTranslationJobs(jobs: {foo: job1, bar: job2}))
