# Batteries (included)

Tired of copying the same Rake tasks to every single Roda/Sinatra project you
start? Me too.

Use batteries to get a head start.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'batteries'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install batteries

## Usage

Incorporate the Batteries Rake tasks into your Rakefile, using some sane defaults:

    Batteries::Tasks.new

But you'll likely want something a bit more advanced, to suit your particular application layout:

    Batteries::Tasks.new do |t|
      t.migrations.database = "::DB"

      # Customize for your application
      t.migrations.setup_hook = proc do
        require_relative "env"
	require_relative "db"
      end
    end

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/adam12/batteries.

I love pull requests! If you fork this project and modify it, please ping me to see
if your changes can be incorporated back into this project.

That said, if your feature idea is nontrivial, you should probably open an issue to
[discuss it](http://www.igvita.com/2011/12/19/dont-push-your-pull-requests/)
before attempting a pull request.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
