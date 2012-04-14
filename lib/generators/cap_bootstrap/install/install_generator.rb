module CapBootstrap
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)
      argument :ip, type: :string, default: '255.255.255.255'
  
      def generate_deploy_file
        template "deploy.rb", "config/deploy.rb"
      end
  
      private
  
      def application
        File.basename Rails.root
      end
  
      def git_url
        default = 'git@github.com:GITHUB_USER/#{application}.git'
        begin
          git_url = `/usr/bin/env git config --get remote.origin.url`.strip
        rescue
          default
        end
        git_url.blank? ? default : git_url
      end
    end
  end
end
