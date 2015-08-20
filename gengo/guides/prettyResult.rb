require 'json'
require 'to_md'

using ToMd

results = JSON.load(File.read('results.json'))

orders = results.group_by {|r| r['order_id']}
orders.each do |order_id, jobs|
  表の目次 = ['言語', '内容']

  表の内容 = jobs.map {|job|
    [
      [job['lc_src'], job['body_src'].chomp],
      [job['lc_tgt'], job['body_tgt'].chomp]
    ]
  }.flatten(1)

  puts "### #{order_id}"
  puts
  puts [表の目次, *表の内容].to_md
  puts
end
