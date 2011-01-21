NillyVanilly
============

This plugin stores NULL in your database when you try to store an empty string.

It only works for columns you explicitly mention inside your model. It comes
with a rake task which prints out all the columns eligible for nillification.

Since HTTP parameters are always strings, an empty string is sent by form
values for which you did not mean to enter any value. This plugin makes sure
to save NULL in database varchar columns that are defined with DEFAULT NULL.


Example
=======

    class Comment < ActiveRecord::Base
      nillify :author_url
    end

    comment = Comment.create :author_url => ""
    comment.author_url        # -> nil
  

Installation
============

    ./script/plugin install git://github.com/tilsammans/nilly_vanilly.git

You can also install this plugin as a gem, but then you won't have the fancy
rake task to inspect your database (see below). But you'll gain the ability
to upgrade easily when I release a new version. And you can always run the
inspection using script/runner:

    ./script/runner "NillyVanilly::Inspect.print"


Inspection
==========

To see what columns are eligible for nillification, run the following:

    rake nilly:vanilly:inspect

This will print a list of all tables in your database, cross-referenced with
the models in your application. All text columns which may be NULL and are
nil by default are shown, i.e. all these columns should be safe to nillify.
This does not take into account any validations you might have.

When a column has already been nillified, it will be indicated with [OK].


But WHY?!!
==========

You: who cares that empty strings are stored in the database?
Me: if you don't care, just move along. And would I recommend you nillify
every attribute in your application? No. But beside from the fact that NULL
is the "correct" value for something you don't know, enforcing this is
required if you have a unique index on that column. Unique indexes are the
fastest you can have, and they deal great with NULL values. Empty strings?
Not so much so.


Author
======

Joost Baaij
<joost@spacebabies.nl>
[www.spacebabies.nl](http://www.spacebabies.nl/)