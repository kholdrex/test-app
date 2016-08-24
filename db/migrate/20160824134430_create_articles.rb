class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, index: true
      t.string :url
      t.string :author

      t.timestamps null: false
    end
  end
end
