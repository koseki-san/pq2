require_relative '../lib/pq2'
require_relative 'email'
require 'benchmark/ips'
require 'set'

[100, 1_000, 10_000].each do |size|
  locals = ('aa'..'zz').to_a
  domains = locals.map {|x| "#{x}.com"}
  emails = locals.product(domains)
    .map {|local, domain| "#{local}@#{domain}"}
    .shuffle
    .slice(0, size)
    .map(&Email.method(:new))
  puts "When the number of elements is #{emails.size}."

  Benchmark.ips do |x|
    x.report('pq2') do
      queue = Pq2.new(emails)
      while queue.pop
      end
    end

    x.report('naive sorted set') do
      queue = SortedSet.new
      emails.each(&queue.method(:add))
      while value = queue.first
        queue.delete(value)
      end
    end

    x.compare!
  end
end
