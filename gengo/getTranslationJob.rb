require 'gengo'
require 'json'

gengo = Gengo::API.new(
  public_key:  ENV['GENGO_PUBLIC_KEY'],
  private_key: ENV['GENGO_PRIVATE_KEY'],
  sandbox:     !!ENV['GENGO_USE_SANDBOX'],
)

id = ARGV.first
puts JSON.dump(gengo.getTranslationJob(id: id))
