class CommunityMember < ActiveRecord::Migration[5.0]
  def change
    create_table :community_members do |t|
      t.references :user, foreign_key: true
      t.references :community, foreign_key: true
      t.boolean :facilitator, default: false

      t.timestamps
      t.index [:user_id, :community_id], unique: true
    end
  end
end
