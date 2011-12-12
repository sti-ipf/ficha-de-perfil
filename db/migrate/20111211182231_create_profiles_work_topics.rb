class CreateProfilesWorkTopics < ActiveRecord::Migration
  def self.up
    create_table :profiles_work_topics, :id => false do |t|

      t.references :profile
      t.references :work_topic

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles_work_topics
  end
end