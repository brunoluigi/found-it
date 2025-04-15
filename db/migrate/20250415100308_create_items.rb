class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items, id: :uuid do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true, type: :bigint

      t.timestamps
    end
  end
end
