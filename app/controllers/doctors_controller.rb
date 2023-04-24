class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def destroy
    doctor = Doctor.find(params[:id])
    patient = doctor.patients.first
    doctor.patients.delete(patient)
    redirect_to doctor_path(doctor)
  end

  Private
  def doctor_params
  end
end