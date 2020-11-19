class Event < ApplicationRecord
  has_many :user_events, foreign_key: :attended_event_id
  belongs_to :creator, class_name: 'User'
  has_many :attenders, through: :user_event, source: :attender
end
