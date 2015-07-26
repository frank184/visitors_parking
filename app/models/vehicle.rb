class Vehicle < ActiveRecord::Base
  belongs_to :user
  before_validation :special_chars
  before_validation :capitalize

  validates :license_plate, :manufacturer, presence: true
  validates_numericality_of :year, :only_integer => true, :allow_nil => true, :greater_than_or_equal_to => 1900, :less_than_or_equal_to => Time.new.year
  validate :maximum_vehicle_count, :on => :create

  private

  def maximum_vehicle_count
    if user.vehicles.count >= 2
      errors.add(:base, "Maximum vehicle limit reached")
    end
  end

  def special_chars
    self.license_plate = self.license_plate.gsub(/[^0-9A-Z]/i, "").upcase
  end

  def capitalize
    self.manufacturer = self.manufacturer.capitalize
  end
end
