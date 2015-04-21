RailsClientChecker.setup do |config|
  # Set the checker page title
  # Default: "Rails app client checker"
  #
  # config.title = "My cool Rails app checker page"

  # Set the application name that appears in checker final report
  # Default: "this website"
  #
  # config.appname = "CoolApp"

  # Disable default checkers or enable optional checkers
  # These checkers are enabled by default: browser, cookies, assets
  #
  # config.checkers.delete "cookies"
  # config.checkers.delete "assets"
  # config.checkers.delete "browser"
  #
  # Optional checkers: pusher
  # If you enable pusher checker, you need to have it properly configured in your app
  # For more information about pusher, check https://github.com/pusher/pusher-http-ruby
  #
  # config.checkers << "pusher"
  
  # Set the support page link that appears in the failure report message
  # Default: there is no default, the "Contact us" message won't appear
  # If you set a support page link, a message will appear in the failure report saying:
  # "You can also <a>contact us</a> for more help."
  #
  # config.support_page = "Any valid URL, you can also use any ENV variable as well"
end

