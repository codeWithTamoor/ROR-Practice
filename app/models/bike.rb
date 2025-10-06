class Bike < Vehicle
  validates :engine_cc, presence: true
  def honk
    "Vroom!"
  end
end
