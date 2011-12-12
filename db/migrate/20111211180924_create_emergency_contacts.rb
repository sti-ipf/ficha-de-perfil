class CreateEmergencyContacts < ActiveRecord::Migration
  def self.up
    create_table :emergency_contacts do |t|
      t.references :profile
      t.string :name
      t.string :relationship
      t.string :contact
      t.string :phone
      t.string :mobile
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :emergency_contacts
  end
end
