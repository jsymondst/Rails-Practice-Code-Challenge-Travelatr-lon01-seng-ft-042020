class SetDefaultLikesInPosts < ActiveRecord::Migration[5.1]
  def change
    change_column_default :posts, :likes, to: 0
  end
end
