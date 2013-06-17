# This migration comes from refinery_help_requests (originally 1)
class CreateHelpRequestsHelpRequests < ActiveRecord::Migration

  def up
    create_table :refinery_help_requests do |t|
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
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-help_requests"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/help_requests/help_requests"})
    end

    drop_table :refinery_help_requests

  end

end
