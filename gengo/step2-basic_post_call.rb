require 'gengo'
require 'json'

gengo = Gengo::API.new(
  public_key:  ENV['GENGO_PUBLIC_KEY'],
  private_key: ENV['GENGO_PRIVATE_KEY'],
  sandbox:     true,
)

job1 = {
    type:         'text',
    slug:         'job test 1',
    body_src:     'one two three four',
    lc_src:       'en',
    lc_tgt:       'ja',
    tier:         'standard',
    auto_approve: 1,
    custom_data:  'some custom data untouched by Gengo.',
}
job2 = {
    type:         'text',
    slug:         'job test 2',
    body_src:     'five six seven eight',
    lc_src:       'en',
    lc_tgt:       'ja',
    tier:         'standard',
    comment:      'This one has a comment',
}

begin
  puts JSON.dump(gengo.postTranslationJobs(jobs: {job1: job1, job2: job2}))
rescue => e
  require 'pry'
  binding.pry
end
