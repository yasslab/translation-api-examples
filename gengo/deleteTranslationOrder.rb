require 'gengo'
require 'json'

gengo = Gengo::API.new(
  public_key:  ENV['GENGO_PUBLIC_KEY'],
  private_key: ENV['GENGO_PRIVATE_KEY'],
  sandbox:     ENV['GENGO_USE_SANDBOX'],
)

order_id = ARGV.first
puts JSON.dump(gengo.deleteTranslationOrder(id: order_id))
