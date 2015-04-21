module RailsClientChecker
  class InitializerGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    desc "This generator creates an initializer configuration file for rails_client_checker at config/initializers"
    def create_initializer_file
      copy_file "initializer.rb", "config/initializers/rails_client_checker.rb"
    end

  end
end