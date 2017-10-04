# GhostRb [![Build Status](https://travis-ci.org/renehernandez/ghost_rb.svg)](https://travis-ci.org/renehernandez/ghost_rb) [![Code Climate](https://codeclimate.com/github/renehernandez/ghost_rb/badges/gpa.svg)](https://codeclimate.com/github/renehernandez/ghost_rb) [![Test Coverage](https://codeclimate.com/github/renehernandez/ghost_rb/badges/coverage.svg)](https://codeclimate.com/github/renehernandez/ghost_rb/coverage)

GhostRb is a simple REST API client to interact with a given Ghost blog. As of now, it supports Client Authentication, which means it can only query public data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ghost_rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ghost_rb

## Usage

#### Client

To create a new client:

```ruby
client = GhostRb::Client.new('URL', 'CLIENT_ID'], 'CLIENT_SECRET')
```

#### Posts

To get a list with all the blog posts, simply write:

```ruby
status, posts = client.get_posts 
```

You can change the *limit* (defaults to all) of posts to return for the query and whether to include *author* and *tags* information.

#### Tags

To get a list with all the tags, write instead:

```ruby
status, tags = client.get_tags
```

You can change the *limit* (defaults to all) of tags to return for the query and whether to include *count.posts* information.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/renehernandez/ghost_rb.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

