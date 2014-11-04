# Warden Doorkeeper Strategy

## Introduction

This is an authentication strategy for
[Warden](https://github.com/hassox/warden) that integrates with
[Doorkeeper](https://github.com/doorkeeper-gem/doorkeeper).

Doorkeeper does not natively play well with Warden and Devise. The goal of this
gem is to provide better support for those running Doorkeeper alongside
Devise/Warden. Instead of protecting controllers using `doorkeeper_authorize!`
you may use your Devise and Warden protection methods,
e.g. `authenitcate_user!`, to achieve the same effect but have your usual
bindings work, e.g. `current_user`.

## Setup

Pretty easy if you use bundler:

```ruby
gem "warden-doorkeeper"
```

Or if you use RubyGems:

    gem install warden-doorkeeper

Then `require "warden/strategies/doorkeeper"` in your project code (or your
Gemfile) and add it to the Warden strategies collection as such:

    Warden::Strategies.add(:doorkeeper, Warden::Strategies::Doorkeeper)

Now you may authenticate using the strategy name `:doorkeeper`, but you can
change that part to whatever you'd like.
