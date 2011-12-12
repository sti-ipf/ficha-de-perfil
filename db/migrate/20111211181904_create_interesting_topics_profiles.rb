class CreateInterestingTopicsProfiles < ActiveRecord::Migration
  def self.up
    create_table :interesting_topics_profiles, :id => false do |t|

      t.references :profile
      t.references :interesting_topic

      t.timestamps
    end
  end

  def self.down
    drop_table :interesting_topics_profiles
  end
end
