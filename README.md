# Awss3sync

A wrapper for the AWS S3 cli.

##### This gem does not copy files locally.

## Disclaimer

`use at your own risk!` I am not held responsible for the use of this gem. If you are not sure it will work for you, install it on a vagrant vm and give it a try there. The Vagrantfile in this repo can to take care of configuring a useable vm.

## Usage

`awss3sync` - view the help menu

`awss3sync list` - to list all directories

`awss3ync list -f some/directory` - to list the contents of a given directory

`awss3sync sync -f some/directory -t some/directory` - sync contents `from` one directory `to` another directory

> Alias:

>`-f` = `--from`

>`-t` = `--to`

>`p` = `--protocol` default is s3://

When syncing folders the output should look something like this:

`Syncing From: directory1 To: directory2`

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'awss3sync'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install awss3sync

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Releasing
To release a new version,

* update the version number in `version.rb`
* tag the the code `git tag v*.*.*`
* push the tag `git push --tags`
* then run `bundle exec rake build`
* `gem push pkg/awss3sync-version`

Which will push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vmcilwain/awss3sync. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
