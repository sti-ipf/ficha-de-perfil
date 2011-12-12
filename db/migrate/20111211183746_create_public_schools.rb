class CreatePublicSchools < ActiveRecord::Migration
  def self.up
    create_table :public_schools do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :country
      t.string :role
      t.string :period
      t.references :profile

      t.timestamps
    end
  end

  def self.down
    drop_table :public_schools
  end
end
