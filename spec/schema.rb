ActiveRecord::Schema.define(:version => 0) do
  create_table :posts, :force => true do |t|
    t.string :title, :default => nil, :null => true
  end
  
  create_table :comments, :force => true do |t|
    t.string :author, :default => nil, :null => true
    t.string :author_email, :default => nil, :null => true
  end
end