class CreateCalls < ActiveRecord::Migration[6.1]
  def change
    create_table :calls do |t|
      t.time :schedule_time
      t.datetime :duration
      t.integer :speaker_id
      t.integer :caller_id
      t.integer :language_id

      t.timestamps
    end
  end
end
