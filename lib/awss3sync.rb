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
        %x{aws s3 ls #{prefix}#{options[:from]}/}.gsub(/\s+PRE/, '').split("\s")
      end

      def prefix
        's3://'
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
    desc 'sync', 'Sync all contents from one s3 bucket to another'
    long_desc <<-LONGDESC
    -f    --from
          Directory to sync from
    -t    --to
          Directory to sync to
    LONGDESC
    def sync
      aws?
      list_contents.reject{|directory| directory == 'backups/'}.each do |dir|
        say "Syncing: #{dir} From: #{options[:from]} To: #{options[:to]}"
        %x{aws s3 sync #{prefix}#{options[:from]}/#{dir} #{prefix}#{options[:to]}/#{dir}}
      end
    end

    method_option :from, type: :string, required: true, aliases: :f
    method_option :to, type: :string, required: true, aliases: :t
    desc 'dir', 'Sync contents of a specific directory in an s3 bucket to another'
    long_desc <<-LONGDESC
    -f    --from
          Directory to sync from
    -t    --to
          Directory to sync to
    LONGDESC
    def dir
      aws?
      say "Syncing From: #{options[:from]} To: #{options[:to]}"
      %x{aws s3 sync #{prefix}#{options[:from]}/ #{prefix}#{options[:to]}/}
    end
  end
end

Awss3sync::Awss3sync.start(ARGV)
