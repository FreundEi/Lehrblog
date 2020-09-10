class CreateInqueries < ActiveRecord::Migration[5.2]
  def change
    create_table :inqueries do |t|
      t.integer :user_id
      t.integer :article_id
      t.string :name
      t.text :message

      t.timestamps
    end
  end
end
