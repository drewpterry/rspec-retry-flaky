# RetryFlakyExample

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'retry_flaky_example'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install retry_flaky_example

require in ```rspec_helper.rb```

```ruby
RSpec.configure do |c|
  c.verbose_retry_flack_example = true # turn on retry flack example verbose
  c.flaky_retry_count = 3 # retry count when failed the example
  c.flaky_sleep_interval = 10 # sleep interval between retry the example
end
```

## Usage

### progress message when the example retry

```
Retry flaky 1 times: ./spec/example.rb:10
Retry flaky 2 times: ./spec/example.rb:10
Retry flaky 3 times: ./spec/example.rb:10
```

### Configurations

- verbose_retry_flack_example(default: false)
- flaky_retry_count(default: 1)
- flaky_sleep_interval(default: 0)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/retry_flaky_example/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
