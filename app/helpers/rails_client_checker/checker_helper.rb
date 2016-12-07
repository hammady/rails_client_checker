module RailsClientChecker
  module CheckerHelper
    # http://stackoverflow.com/questions/35251759/undefined-method-find-asset-for-nilnilclass/37820647#37820647
    def inline_asset(name)
      assets = Rails.application.assets || ::Sprockets::Railtie.build_environment(Rails.application)
      assets.find_asset(name).to_s
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
