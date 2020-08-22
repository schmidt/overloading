# Overloading

This is a little hack, that's bringing method overloading to Ruby. There's been
others that have done this before. And they've probably also done it more
reliable or with less code or supporting more edge cases or all the that
together. But for me this was just a little riddle to solve and to brush up my
meta programming skills.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'overloading', git: 'https://github.com/schmidt/overloading'
```

And then execute:

    $ bundle


## Usage

**My suggestion would be: Better don't use it!**

**Named paramters are not supported. The behaviour for methods with named
parameters is not defined.**

Yet, if you can't be stopped: This is how it's used.

```ruby
class Example
  include Overloading

  def action(one)
    :one_arg
  end

  def action(one, two)
    :two_args
  end
end

Example.new.action(1)    # => :one_arg
Example.new.action(1, 2) # => :two_args
```

**Please note:** With `Overloading`, if you're calling a method with an
incorrect number of arguments, then this will trigger a `NoMethodError` instead
of an `ArgumentError`. Because with method overloading, calling a method with an
unexpected number of arguments is closer to calling a method, that wasn't
defined. Also it was easier to manage inheritance this way.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, and
push git commits and tags.


## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/schmidt/overloading.

The next step would be supporting methods with rest args, e.g. `def
example(*rest)` vs. `def example(first, *rest)`.
