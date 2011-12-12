class CreateInterestingTopics < ActiveRecord::Migration
  def self.up
    create_table :interesting_topics do |t|
      t.string :topic

      t.timestamps
    end
  end

  def self.down
    drop_table :interesting_topics
  end
end
