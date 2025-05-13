class CreateItemViews < ActiveRecord::Migration[7.0]
  def change
    create_table :item_views do |t|
      t.references :item, null: false, foreign_key: true, type: :uuid
      t.string :ip_address, null: false
      t.string :anon_user_hash, null: false

      t.timestamps
    end
    add_index :item_views, [ :item_id, :ip_address, :anon_user_hash ], unique: true, name: 'index_item_views_on_item_and_ip_and_anon_hash'
  end
end
