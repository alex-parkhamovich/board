class ChangePostStatusDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :status, :string, :default => 'new'
  end
end
