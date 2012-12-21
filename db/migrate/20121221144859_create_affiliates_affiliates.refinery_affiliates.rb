# This migration comes from refinery_affiliates (originally 1)
class CreateAffiliatesAffiliates < ActiveRecord::Migration

  def up
    create_table :refinery_affiliates do |t|
      t.string :url
      t.string :title
      t.string :specialist1
      t.string :specialist2
      t.string :specialist3
      t.integer :photo_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-affiliates"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/affiliates/affiliates"})
    end

    drop_table :refinery_affiliates

  end

end

