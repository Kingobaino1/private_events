class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attenders, class_name: 'User'
end
