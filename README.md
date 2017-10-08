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
client = GhostRb::Client.new('URL', 'CLIENT_ID', 'CLIENT_SECRET')
```

**Note:** If parameters are not specified for resources retrieval, the default values, as specified by [Ghost API](https://api.ghost.org/), are used.

#### Posts

To access posts from the blog, first create a controller:

```ruby
ctrl = GhostRb::Controllers::PostsController.new(client) # using previous defined client var
```

A handier way to get the controller is:
```ruby
ctrl = client.posts
```

##### Single post by id

```ruby
post = client.posts.find_by(id: 'lhafdkaalkdfha')
```

##### Single post by slug

```ruby
post = client.posts.find_by(slug: 'welcome-to-ghost')
```

##### Get all post by setting the limit

```ruby
posts = client.posts.limit('all').all
```

##### Using where

```ruby
ctrl = client.posts
posts = posts.where(include: 'tags, author', limit: 5).all
```

#### Tags

Similarly for tags, you can create directly the controller or call it from the client instance.


```ruby
ctrl = GhostRb::Controllers::TagsController.new(client)
# or
ctrl = client.tags
```

##### All tags

```ruby
tags = client.tags.limit('all').all
```

## Documentation

The documentation lives at the [github pages](https://renehernandez.github.io/ghost_rb/). For the nitty gritty details of the implementation go to [http://www.rubydoc.info/gems/ghost_rb](http://www.rubydoc.info/gems/ghost_rb).

You can also go check [this post](https://bitsofknowledge.net/2017/10/02/ghost_rb-a-ghost-rest-api-client/) where I have provided an analysis of the implementation.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/renehernandez/ghost_rb.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

