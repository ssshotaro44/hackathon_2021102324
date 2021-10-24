class CreateChoseTalkTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :chose_talk_topics do |t|
      t.integer :talk_topic_id
      t.integer :user_id

      t.timestamps
    end
  end
end
