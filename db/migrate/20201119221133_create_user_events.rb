class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_events do |t|
      t.integer :attended_event_id
      t.integer :attender_id

      t.timestamps
    end
  end
end
