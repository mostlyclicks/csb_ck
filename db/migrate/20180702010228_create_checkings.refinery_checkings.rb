# This migration comes from refinery_checkings (originally 1)
class CreateCheckings < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_checkings do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :additional_comments

     t.timestamps
    end

    add_index :refinery_checkings, :id
  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "checkings"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/checkings"})
    end

    drop_table :refinery_checkings
  end

end
