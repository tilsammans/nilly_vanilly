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


Inspection
==========

To see what columns are eligible for nillification, run the following:

    rake nilly:vanilly:inspect

This will print a list of all tables in your database, cross-referenced with
the models in your application. All text columns which may be NULL and are
nil by default are shown, i.e. all these columns should be safe to nillify.
This does not take into account any validations you might have.

When a column has already been nillified, it will be indicated with [OK].


Author
======

Joost Baaij
<joost@spacebabies.nl>
[www.spacebabies.nl](http://www.spacebabies.nl/)