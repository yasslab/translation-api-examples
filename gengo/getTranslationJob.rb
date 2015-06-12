require 'gengo'
require 'json'

gengo = Gengo::API.new(
  public_key:  ENV['GENGO_PUBLIC_KEY'],
  private_key: ENV['GENGO_PRIVATE_KEY'],
  sandbox:     true,
)

id = ARGV.first
puts JSON.dump(gengo.getTranslationJob(id: id))
