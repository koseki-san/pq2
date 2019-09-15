# Pq2

Priority Queue implementation using Heap in pure Ruby.

Remarkable, this library does not do garbage collection, because it is optimized for short-lived processes.

## Usage

### Scalar

```ruby
pq = Pq2.new
pq.push(2)
pq.push(1)
pq.push(3)

pq.pop
# => 1
pq.first
# => 2
pq.pop
# => 2
pq.pop
# => 3

pq.empty?
# => true
```

### Comparable

```ruby
emails = %w[a@github.com a@example.com b@example.com].map(&Email.method(:new))
pq = Pq2.new(emails)
pq.pop
# => 'a@example.com'
pq.pop
# => 'b@example.com'
pq.pop
# => 'a@github.com'

class Email
  include Comparable

  attr_reader :domain, :local

  def initialize(email)
    @local, @domain = email.split(?@)
  end

  def <=>(other)
    order = domain <=> other.domain
    return order unless order == 0
    local <=> other.domain
  end
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pq2', git: 'git@github.com:koseki-san/pq2.git', branch: 'master'
```

And then execute:

    $ bundle

## Benchmark

```
ruby benchmark/benchmark.rb

When the number of elements is 100.
Warming up --------------------------------------
                 pq2   505.000  i/100ms
    naive sorted set    34.000  i/100ms
Calculating -------------------------------------
                 pq2      5.055k (± 2.1%) i/s -     25.755k in   5.097600s
    naive sorted set    338.335  (± 2.1%) i/s -      1.700k in   5.026883s

Comparison:
                 pq2:     5054.6 i/s
    naive sorted set:      338.3 i/s - 14.94x  slower


When the number of elements is 1000.
Warming up --------------------------------------
                 pq2    32.000  i/100ms
    naive sorted set     1.000  i/100ms
Calculating -------------------------------------
                 pq2    322.963  (± 2.2%) i/s -      1.632k in   5.055332s
    naive sorted set      2.111  (± 0.0%) i/s -     11.000  in   5.211523s

Comparison:
                 pq2:      323.0 i/s
    naive sorted set:        2.1 i/s - 153.00x  slower


When the number of elements is 10000.
Warming up --------------------------------------
                 pq2     2.000  i/100ms
    naive sorted set     1.000  i/100ms
Calculating -------------------------------------
                 pq2     22.911  (± 0.0%) i/s -    116.000  in   5.063799s
    naive sorted set      0.010  (± 0.0%) i/s -      1.000  in 103.354271s

Comparison:
                 pq2:       22.9 i/s
    naive sorted set:        0.0 i/s - 2367.94x  slower
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/koseki-san/pq2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Pq2 project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/pq2/blob/master/CODE_OF_CONDUCT.md).
