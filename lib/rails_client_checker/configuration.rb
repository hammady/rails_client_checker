module RailsClientChecker
  class Configuration

    attr_accessor :checkers, :title, :appname, :support_page

    def initialize
      @checkers = %w(browser cookies assets)
      @title = "Rails app client checker"
      @appname = "this website"
      @support_page = ""
    end

  end

  class << self
    attr_accessor :config_instance

    def config
      self.config_instance ||= Configuration.new
    end

    def setup
      yield config
    end
  end

end
