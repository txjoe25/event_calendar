class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees
  has_many :comments
  validate :event_cannot_be_in_the_past
  def event_cannot_be_in_the_past
  	if date.present? && date < Date.today
  		errors.add(:date, "Cant be in the past")
  	end
  end
end

