class Car < Vehicle
  # validation
  validates :door, presence: true

  def honk
    "Beep beep 🚗!"
  end
end
