class ChangePostPriceTypeToInt < ActiveRecord::Migration[5.0]
  def change
    change_column :posts, :price, :integer
  end
end
