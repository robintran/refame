class CreateAffiliatesAffiliates < ActiveRecord::Migration

  def up
    create_table :refinery_affiliates do |t|
      t.string :url
      t.string :title
      t.string :specialist
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
