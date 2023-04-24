class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def only_over_eighteen
    where("age >= '18'")
    .order(:name)
  end
end
