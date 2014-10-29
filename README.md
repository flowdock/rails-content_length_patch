# Content-Length for Rails 4.1 and older

Monkey patch for Rails that adds Content-Length header to responses. This is
needed as `Rack::BodyProxy` is not compatible with `Rack::ContentLength`.

The functionality is fixed in Rails 4.2.

## Caveats

Does not work as expected if responses are modified in Rack middleware.

## Installation

Add this line to your Rails application's Gemfile:

```ruby
gem 'rails-content_length_patch'
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rails-content_length_patch/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
