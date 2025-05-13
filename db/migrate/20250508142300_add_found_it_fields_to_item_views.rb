class AddFoundItFieldsToItemViews < ActiveRecord::Migration[7.0]
  def change
    add_column :item_views, :found_it_at, :datetime
    add_column :item_views, :found_it_message, :text
  end
end
