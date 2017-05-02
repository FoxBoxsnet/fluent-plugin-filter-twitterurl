# Fluent::Plugin::Filter::Timestamp

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/fluent/plugin/filter/timestamp`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fluent-plugin-filter-timestamp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fluent-plugin-filter-timestamp

## Usage

```
<filter foo.**>
  key_time      time
  key_format    '%b %e %H:%M:%S'
  key_postfix   timestamp
</filter>
```

## License
* Apache License Version 2.0
