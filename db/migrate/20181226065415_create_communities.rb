class CreateCommunities < ActiveRecord::Migration[5.0]
  def change
    create_table :communities do |t|
      t.string :name
      t.text :description
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
