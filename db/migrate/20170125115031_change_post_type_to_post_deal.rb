class ChangePostTypeToPostDeal < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :type, :deal
  end
end
