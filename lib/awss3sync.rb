require_relative "awss3sync/version"
require 'thor'

module Awss3sync
  class Awss3sync < Thor
    include Thor::Actions

    no_commands do
      def aws?
        raise 'Requires AWS CLI Installation' if %x{which aws}.empty?
      end

      def list_contents
        %x{aws s3 ls #{options[:from]}/}.split("\n").map{|str| string_to_array(str).last}
      end

      def string_to_array(str)
        str.split("\s")
      end
    end

    method_option :from, type: :string, aliases: :f
    desc 'list', 'List S3 directories'
    long_desc <<-LONGDESC
    -f    --from
          Directory to view contents
    LONGDESC
    def list
      aws?
      say list_contents
    end

    method_option :from, type: :string, required: true, aliases: :f
    method_option :to, type: :string, required: true, aliases: :t
    method_option :protocol, type: :string, aliases: :p, default: 's3://'
    desc 'sync', 'Sync all contents from one s3 bucket to another'
    long_desc <<-LONGDESC
    -f    --from
          Directory to sync from
    -t    --to
          Directory to sync to
    -p    --protocol
          The protocol example: 's3://'
    LONGDESC
    def sync
      aws?
      list_contents.reject{|directory| directory == 'backups/'}.each do |dir|
        say "Syncing: #{dir} From: #{options[:from]} To: #{options[:to]}"
        %x{aws s3 sync #{options[:protocol]}#{options[:from]}/#{dir} #{options[:protocol]}#{options[:to]}/#{dir}}
      end
    end
  end
end

Awss3sync::Awss3sync.start(ARGV)
