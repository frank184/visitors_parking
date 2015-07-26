class Vehicle < ActiveRecord::Base
  belongs_to :user
  validate :maximum_vehicle_count, :on => :create

  validates :license_plate, presence: true, length: { minimum: 6, maximum: 6 }
  validates :colour, presence: true
  validates :manufacturer, presence: true
  validates :model, presence: true
  validates :year, presence: true, length: { minimum: 4, maximum: 4 }

  private
  def maximum_vehicle_count
    if user.vehicles.count >= 2
      errors.add(:base, "Maximum vehicle limit reached")
    end
  end

  def license_plate_format
  end

  def telephone_format
  end
end
