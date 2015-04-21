module RailsClientChecker
  module CheckerHelper
    def inline_asset(name)
      filename = Rails.application.assets.find_asset(name).pathname
      File.read filename
    end

    def inline_javascript_tag(name)
      ("<script type='text/javascript'>\n" +
      inline_asset(name) +
      "\n</script>")
      .html_safe
    end

    def inline_stylesheet_tag(name)
      ("<style>\n" +
      inline_asset(name) +
      "\n</style>")
      .html_safe
    end

    def checker_enabled?(name)
      ::RailsClientChecker.config.checkers.include? name
    end

  end
end
