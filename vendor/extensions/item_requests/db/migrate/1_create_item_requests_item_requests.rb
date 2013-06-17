class CreateItemRequestsItemRequests < ActiveRecord::Migration

  def up
    create_table :refinery_item_requests do |t|
      t.string :title
      t.text :description
      t.string :contact
      t.datetime :expires
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-item_requests"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/item_requests/item_requests"})
    end

    drop_table :refinery_item_requests

  end

end
