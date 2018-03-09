# NillyVanilly

This Rails gem/plugin stores NULL in your database when you try to store an empty string.

It only works for columns you explicitly mention inside your model. It comes
with a rake task which prints out all the columns eligible for nillification.

Since HTTP parameters are always strings, an empty string is sent by form
values for which you did not mean to enter any value. This plugin makes sure
to save NULL in database varchar columns that are defined with DEFAULT NULL.


## Example

``` ruby
class Comment < ActiveRecord::Base
  nillify :author_url
end

comment = Comment.create :author_url => ""
comment.author_url        # -> nil
```

## Installation

Install this gem using Bundler:

``` ruby
gem 'nilly_vanilly'
```

and then run `bundle`.


## Inspection

To see what columns are eligible for nillification, run the following:

```
rake nilly:vanilly:inspect
```

This will print a list of all tables in your database, cross-referenced with
the models in your application. All text columns which may be NULL and are
nil by default are shown, i.e. all these columns should be safe to nillify.
This does not take into account any validations you might have.

When a column has already been nillified, it will be indicated with [OK].

## But WHY?!!

You: who cares that empty strings are stored in the database?
Me: if you don't care, just move along. And would I recommend you nillify
every attribute in your application? No. But beside from the fact that NULL
is the "correct" value for something you don't know, enforcing this is
required if you have a unique index on that column. Unique indexes are the
fastest you can have, and they deal great with NULL values. Empty strings?
Not so much so.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tilsammans/nilly_vanilly. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NillyVanilly project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/tilsammans/nilly_vanilly/blob/master/CODE_OF_CONDUCT.md).


## Author

Joost Baaij
<joost@spacebabies.nl>
[www.spacebabies.nl](http://www.spacebabies.nl/)
