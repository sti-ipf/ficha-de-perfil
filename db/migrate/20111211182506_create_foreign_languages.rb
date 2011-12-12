class CreateForeignLanguages < ActiveRecord::Migration
  def self.up
    create_table :foreign_languages do |t|
      t.string :language

      t.timestamps
    end
  end

  def self.down
    drop_table :foreign_languages
  end
end
