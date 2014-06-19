require 'rest-client'
require 'open-uri'

module Paperclip
  module Storage
    module Upyun
      def self.extended base
        base.instance_eval do

          # Please use the latest paperclip from git://github.com/thoughtbot/paperclip.git
          # Since the latest one solves this issue:
          # https://github.com/thoughtbot/paperclip/issues/655

          @upyun_bucketname = @options[:upyun_bucketname] || Paperclip::Storage::Upyun::Config[:upyun_bucketname]
          @upyun_username =  @options[:upyun_username] || Paperclip::Storage::Upyun::Config[:upyun_username]
          @upyun_password =  @options[:upyun_password] || Paperclip::Storage::Upyun::Config[:upyun_password]
          @upyun_domain = @options[:upyun_domain] || Paperclip::Storage::Upyun::Config[:upyun_domain]
          @upyun_api_host = @options[:upyun_api_host] || Paperclip::Storage::Upyun::Config[:upyun_api_host] || 'http://v0.api.upyun.com/'

          @options[:path] = @options[:path].gsub(/:url/, @options[:url]).gsub(/^:rails_root\/assets/, @upyun_domain)
          @options[:url] =  @upyun_domain + @options[:url]

          @resource = RestClient::Resource.new("#{@upyun_api_host}#{@upyun_bucketname}", :user => @upyun_username, :password => @upyun_password )
        end
      end

        def exists?(style_name = default_style)
          if original_filename
              relative_path = URI::encode path(style_name).gsub(@upyun_domain, '')
              begin
                true if @resource[relative_path].get.code == 200
              rescue RestClient::ResourceNotFound
                false
              end
          else
            false
          end
        end


        def flush_writes #:nodoc:
          @queued_for_write.each do |style_name, file|
            current_path = ''
            relative_path = URI::encode path(style_name).gsub(@upyun_domain, '')

            @resource[relative_path].post file, {'Expect' => '', 'Mkdir' => 'true'}
          end

          after_flush_writes # allows attachment to clean up temp files

          @queued_for_write = {}
        end

        def flush_deletes #:nodoc:
          @queued_for_delete.each do |path|
            relative_path = URI::encode path.gsub(@upyun_domain, '')
            begin
              @resource[relative_path].delete
            rescue
            end
          end
          @queued_for_delete = []
        end

    end
  end
end
