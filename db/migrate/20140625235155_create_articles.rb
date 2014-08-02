class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :abstract
      t.text :text
      t.references :category, index: true
      t.timestamps
    end
  end
end
