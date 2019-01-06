class CreateCommunityComments < ActiveRecord::Migration[5.0]
  def change
    create_table :community_comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :community_topic, foreign_key: true

      t.timestamps
    end
  end
end
