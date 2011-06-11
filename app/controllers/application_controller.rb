class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_assets

  # this makes the css and js organized
  def set_assets

    @custom_csses = []
    @custom_javascripts = []


    action_hash = {"create" => "new", "update" => "edit"}
    file_name = action_hash[action_name] ? action_hash[action_name] : action_name
    root = Rails.root.to_s

    @custom_csses << "compiled/application.css" # always include the layout css
    @custom_csses << "compiled/#{controller_name}/#{file_name}.css" if File.exist?("#{root}/public/stylesheets/compiled/#{controller_name}/#{file_name}.css")
    @custom_csses << "compiled/#{controller_name}/all.css" if File.exist?("#{root}/public/stylesheets/compiled/#{controller_name}/all.css")


    @custom_javascripts << "#{controller_name}/#{file_name}.js" if File.exist?("#{root}/public/javascripts/#{controller_name}/#{file_name}.js") # && !("#{file_name}.js" == "consumer_index.js")
    @custom_javascripts << "#{controller_name}/all.js" if File.exist?("#{root}/public/javascripts/#{controller_name}/all.js")

    # a trick to include facebox in the (devise-owned) registrations controller
    include_facebox if controller_name == 'registrations' && action_name == 'edit'

  end

end
