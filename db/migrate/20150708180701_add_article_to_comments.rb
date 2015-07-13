class AddArticleToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :article, index: true
    add_foreign_key :comments, :articles
    add_index :comments, [:user_id, :article_id, :created_at]
  end
end
