module RailsClientChecker
  class ViewGenerator < Rails::Generators::Base
    source_root File.expand_path("../../../../app/views/rails_client_checker/checker", __FILE__)

    desc "This generator copies the checker page view so that you can customize the page html"
    def copy_view
      empty_directory "app/views/rails_client_checker/checker"
      copy_file "check.html.erb", "app/views/rails_client_checker/checker/check.html.erb"
      copy_file "_noscript.html.erb", "app/views/rails_client_checker/checker/_noscript.html.erb"
    end

    desc "This generator copies the checker stylesheet so that you can customize the css"
    def copy_stylesheet
      copy_file "../../../assets/stylesheets/rails_client_checker/check.css", "app/assets/stylesheets/rails_client_checker/check.css"
      puts "You MUST restart your rails server before your modifications to the above files can take effect"
    end
  end
end