class UserEvent < ApplicationRecord
  belongs_to :attended_event, class_name: 'Event'
  belongs_to :attender, class_name: 'User'
end
