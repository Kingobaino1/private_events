class AddIndexToUserEvents < ActiveRecord::Migration[6.0]
  def change
    add_index :user_events, :event_attender_id
    add_index :user_events, :attended_event_id
  end
end
