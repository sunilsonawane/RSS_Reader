class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :title
      t.string :url
      t.text :content
      t.datetime :publish_date

      t.timestamps null: false
    end
  end
end
