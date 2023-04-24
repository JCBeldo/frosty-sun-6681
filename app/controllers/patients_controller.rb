class PatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:id])
    patients = doctor.patients
    patients.destroy
    redirect_to doctor_path(doctor)
  end
end