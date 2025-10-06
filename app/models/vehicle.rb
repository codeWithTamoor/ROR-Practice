class Vehicle < ApplicationRecord
  after_create :log_vehicle
  scope :expensive, -> { where ("price>150000") }

  private
  def log_vehicle
    puts "a new vehicle #{self.type} is added"
  end
end
