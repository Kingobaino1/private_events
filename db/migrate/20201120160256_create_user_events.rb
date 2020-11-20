class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_events do |t|
      t.integer :attended_event_id, foreign_key: true
      t.integer :event_attender_id, foreign_key: true

      t.timestamps
    end
  end
end
