class CreateWorkTopics < ActiveRecord::Migration
  def self.up
    create_table :work_topics do |t|
      t.string :topic

      t.timestamps
    end
  end

  def self.down
    drop_table :work_topics
  end
end
