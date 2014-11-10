# rescue\_up\_to

Rescues / retries a block, up to a number of times.

## Installation

Add this line to your application's Gemfile:

    gem 'rescue_up_to'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rescue_up_to

## Usage

    # Rescue / retry something, up to 10 times
    value = rescue_up_to(10.times) do
      # do something, rescue StandardError and retry up to 10 times ...
    end
    
    # A more complex / useful example, fetch Google's home page
    require 'open-uri'
    contents = rescue_up_to(10.times, from: SocketError, with: ->(rescued_times){sleep rescued_times} ) do
      open('http://www.google.com').read 
    end
    # => "[...]"
  


## Contributing

1. Fork it ( https://github.com/srizzo/rescue_up_to/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Code Status

* [![Build Status](https://travis-ci.org/srizzo/rescue_up_to.svg?branch=master)](https://travis-ci.org/srizzo/rescue_up_to)

## License

MIT