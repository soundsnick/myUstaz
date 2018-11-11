class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :title
      t.timestamps
    end
    create_table :tagsUsers do |s|
      s.integer :user_id
      s.integer :tag_id
    end
  end
end
