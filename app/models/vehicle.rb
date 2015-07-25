class Vehicle < ActiveRecord::Base
  belongs_to :user
  validates_associated :user

  validates :license_plate, presence: true, length: { minimum: 6, maximum: 6 }
  validates :color, presence: true
  validates :manufacturer, presence: true
  validates :model, presence: true
  validates :year, presence: true, length: { minimum: 4, maximum: 4 }
  validates :user, presence: true
end
