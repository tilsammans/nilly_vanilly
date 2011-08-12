class Post < ActiveRecord::Base
  nillify :title
end

class Comment < ActiveRecord::Base
  nillify :author, :author_email
end