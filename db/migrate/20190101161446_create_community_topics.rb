class CreateCommunityTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :community_topics do |t|
      t.references :user, foreign_key: true
      t.references :community, foreign_key: true
      t.string :title
      t.text :content
      t.string :image
      t.integer :view_count, default: 0

      t.timestamps
    end
  end
end
