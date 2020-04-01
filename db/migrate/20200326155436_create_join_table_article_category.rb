class CreateJoinTableArticleCategory < ActiveRecord::Migration[6.0]
  def change
    create_join_table :articles, :categories do |t|
      t.index [:article_id, :category_id]
      t.index [:category_id, :article_id]
    end
  end
end
