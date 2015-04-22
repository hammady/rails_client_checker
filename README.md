# Rails Client Checker

### Problem
Even with 100% coverage integration tests, your Rails application may not work for all users. These are some causes for such situation:

- Some users will be using weird or outdated browsers.
- Cookies may be disabled.
- There could be firewalls blocking access to your asset host, or to third party services
like NewRelic, Google Analytics, Pusher, ...
- Web-sockets could be blocked by ISP, company firewall or by domain-managed computers.
- ...

It is troublesome to write client-side code
in your apps to check these things. You may also spend hours with customers in support
channels trying to identify why it does not work for them.

### Solution
This is a Rails gem offering end-users a page to check their browsers compatibility
with your application. The page is configurable and it works by running several checker modules in their browsers.
Standard modules are: browser name/version, cookies, asset loading and [Pusher](https://pusher.com) connectivity.
You can easily enable/disable standard modules and add custom modules logic purely using Javascript.

### Demo
This gem was extracted from [Rayyan](http://rayyan.qcri.org/) web application and a real client checker page exists [there](http://rayyan.qcri.org/check).


## Installation

The gem was tested on Rails 4.1 and 3.2. If you have a different version and it does not work for you, please create a github issue.

Add this line to your application's Gemfile:

    gem 'rails_client_checker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_client_checker

## Basic Usage

Just add the following to your `config/routes.rb`:

    # config/routes.rb
    YourApp::Application.routes.draw do
      ...
      mount RailsClientChecker::Engine => '/checker'
      ...
    end

This will generate 3 new routes:

1. `/checker/check` that loads the checker page,
2. `/checker/set_cookie` and
3. `/checker/get_cookie`, both used in the cookie test.

You can also mount the routes on `'/'` instead of `'/checker'` if you don't have any conflicting routes in your application. This will make your routes simpler, for example `/check` instead of `/checker/check`.

It is a good idea to insert a link for your brand new checker page in your app. In any ERB template insert the following:

    <%= link_to "Check your browser compatibility", rails_client_checker.check_path %>

It is recommended to place this link in your sign in/sign up page. If you are using [devise](https://github.com/plataformatec/devise) for authentication, [generate the views](https://github.com/plataformatec/devise#configuring-views) then insert the link at the end of `app/views/devise/shared/_links.erb`.


## Configuration
By default 3 standard checker modules are enabled:

1. Browser name/version checker
2. Asset loading checker
3. Cookies checker

The Pusher standard checker is disabled by default.

To enable/disable modules and set other configuration options, generate an initializer:

    rails generate rails_client_checker:initializer

This will generate `config/initializers/rails_client_checker.rb`. Check it for all configuration options. You should restart your rails servers after
changing this file.

### Advanced view customization
If you want to change the look and feel of the checker page, you can easily do this by running the view generator:

    rails generate rails_client_checker:view

This will generate the following:

1. `check.html.erb` for editing the page HTML
2. `check.css`: for editing the page stylesheets
3. `_noscript.html.erb` for editing the text that appears in browsers that do not support Javascript (or having it disabled)

### Adding custom checkers in Javascript
You can add any checker logic to the checkers workflow by defining your `custom_checkers` array.
You can check the [standard checkers implementation](https://github.com/hammady/rails_client_checker/blob/master/app/assets/javascripts/check.js) to get ideas, just look for `checkers.push(...)` in that file.

Assume we want to add a checker called "my random checker" that fails randomly 50% of the time:

    # app/assets/javascripts/custom_checkers.js
    custom_checkers = [
      {
        display: "my random checker",
        worker: function(callback){
          if (Math.random() >= 0.5)
            callback(null)
          else
            callback("50% random error, LOL :)")
        }
      }
    ];
    
Basically, `custom_checkers` is an array of objects, each has 2 attributes:

1. `display` that defines the text that appears in the page
2. `worker` function that does the checker work. You can write any Javascript code inside this function, e.g. do ajax calls, call your own application routes, ... To communicate back the checker result, call the `callback` function with `null` to denote success or any string to describe the error. 

## Tips and Tricks

You can reuse the `<noscript>` tag that appears when the user browser
does not support Javascript in all your pages, without generating 
the gem views. Simply include the following in your layout `application.html.erb`:

    # app/views/layouts/application.html.erb
    ...
    <body>
    ...
    <%= render partial: 'rails_client_checker/checker/noscript' %>
    ...

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## About
This gem was developed by Hossam Hammady at [Qatar Computing Research Institute, Data Analytics](http://da.qcri.org).

Reach me at:

- Twitter: [@hammady](http://www.twitter.com/hammady)
- Email: hhammady@qf[dot]org[dot]qa

The browser compatibility module was taken as is from [Browser-Update.org](http://browser-update.org)
with minor modifications to fit in the gem workflow.

## License
MIT
