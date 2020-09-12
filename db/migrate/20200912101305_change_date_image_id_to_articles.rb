class ChangeDateImageIdToArticles < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :image_id, :string
  end
end
