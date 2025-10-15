# app/models/forecast.rb (if you have a model, otherwise validate in controller)
validates :pincode, presence: true,
                    format: { with: /\A\d{6}\z/, message: "should be exactly 6 digits" }
