class CreateAbilitiesProfiles < ActiveRecord::Migration
  def self.up
    create_table :abilities_profiles, :id => false do |t|

      t.references :profile
      t.references :ability

      t.timestamps
    end
  end

  def self.down
    drop_table :abilities_profiles
  end
end
