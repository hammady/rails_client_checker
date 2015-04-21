# Rails Client Checker

Offer end-users a configurable /check route to check their browsers compatibility with your Rails application,
with the ability to enable/disable standard checker modules or even their own module logic in Javascript.
Standard checkers are: browser name/version, cookies, asset loading and [Pusher](https://pusher.com) connectivity.

## Installation

Add this line to your application's Gemfile:

    gem 'rails_client_checker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_client_checker

## Usage

## Configuration

### Adding custom checkers in Javascript

### Advanced view customization

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## About
This gem was developed by Hossam Hammady at [Qatar Computing Research Institute, Data Analytics](http://da.qcri.org).

Reach me at:
* Twitter: {@hammady}[http://www.twitter.com/hammady]
* Email: hhammady@qf[dot]org[dot]qa

The browser compatibility checker is taken as is from [Browser-Update.org](http://browser-update.org)
with minor modifications to fit in the gem workflow.

## License
MIT
