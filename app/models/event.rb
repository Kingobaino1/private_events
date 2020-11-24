class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :user_events, foreign_key: :attended_event_id
  has_many :event_attenders, through: :user_events, source: :event_attender
end
