class Event < ApplicationRecord
  attr_accessor :month, :day, :year
  validates :title, :description, :date, :location, presence: true
  validate :validate_event_date

  belongs_to :creator, class_name: 'User'
  has_many :user_events, foreign_key: :attended_event_id
  has_many :event_attenders, through: :user_events, source: :event_attender
  scope :prev_events, -> { where "date < ?", Date.today }
  scope :next_events, -> { where "date >= ?", Date.today }

  private

  def valid_date?
    begin
      return true unless self.date.past?
    rescue ArgumentError
      false
    end
  end

  def validate_event_date
    errors.add("Your event date", "is invalid.") unless valid_date?
  end
end
