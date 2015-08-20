# bundle exec ruby getResult.rb > results.json

require 'gengo'
require 'pp'
require 'json'

gengo = Gengo::API.new(
  public_key:  ENV['GENGO_PUBLIC_KEY'],
  private_key: ENV['GENGO_PRIVATE_KEY'],
  sandbox:     !!ENV['GENGO_USE_SANDBOX'],
)

order_ids = [1705989, 1705990, 1705991, 1705992, 1705993, 1705994, 1705995, 1705996, 1705997, 1705998]

job_ids = []
order_ids.each do |order_id|
  job_ids << gengo.getTranslationOrderJobs(order_id: order_id)['response']['order']['jobs_approved']
end
job_ids.flatten!

jobs = []
job_ids.each do |job_id|
  jobs << gengo.getTranslationJob(id: job_id)['response']['job']
end

puts JSON.dump(jobs)
