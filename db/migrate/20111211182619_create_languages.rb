class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.boolean :fluent
      t.boolean :conversation
      t.boolean :read
      t.boolean :write
      t.references :profile
      t.references :foreign_language

      t.timestamps
    end
  end

  def self.down
    drop_table :languages
  end
end
