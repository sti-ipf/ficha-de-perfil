class CreateSocialMoviments < ActiveRecord::Migration
  def self.up
    create_table :social_moviments do |t|
      t.string :name
      t.boolean :has_headquarters
      t.text :address
      t.string :responsible
      t.string :phone
      t.string :email
      t.string :site
      t.integer :moviment_type
      t.references :profile

      t.timestamps
    end
  end

  def self.down
    drop_table :social_moviments
  end
end
