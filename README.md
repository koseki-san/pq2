# Pq2

Priority Queue implementation using Heap.

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
emails = [
  Email.new('a@github.com'),
  Email.new('a@example.com'),
  Email.new('b@github.com'),
  Email.new('b@example.com'),
]
pq = Pq2.new(emails)
pq.pop
# => 'a@example.com'
pq.pop
# => 'b@example.com'
pq.pop
# => 'a@github.com'
pg.pop
# => 'b@github.com'

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/koseki-san/pq2. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Pq2 project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/pq2/blob/master/CODE_OF_CONDUCT.md).
