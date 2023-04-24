require 'rails_helper'

RSpec.describe 'patient index page' do
  let!(:hosp_1) { Hospital.create!(name: "Grey Sloan Memorial Hospital") }
  let!(:hosp_2) { Hospital.create!(name: "Seaside Health & Wellness Center") }
  let!(:doc_1) { hosp_1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University") }
  let!(:doc_2) { hosp_2.doctors.create!(name: "Alex Karev", specialty: "Pediatric Surgery", university: "Johns Hopkins University") }
  let!(:doc_3) { hosp_2.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University") }
  let!(:doc_4) { hosp_1.doctors.create!(name: "Derek McDreamy Shepherd", specialty: "Attending Surgeon", university: "University of Pennsylvania") }
  let!(:pat_1) { Patient.create!(name: "Katie Bryce", age: 24) }
  let!(:pat_2) { Patient.create!(name: "Denny Duquette", age: 39) }
  let!(:pat_3) { Patient.create!(name: "Rebecca Pope", age: 32) }
  let!(:pat_4) { Patient.create!(name: "Zola Shepherd", age: 2) }
  let!(:doc_pat_1) { DoctorPatient.create!(doctor_id: doc_1.id, patient_id: pat_1.id) }
  let!(:doc_pat_2) { DoctorPatient.create!(doctor_id: doc_1.id, patient_id: pat_2.id) }
  let!(:doc_pat_3) { DoctorPatient.create!(doctor_id: doc_2.id, patient_id: pat_1.id) }

  describe "displays the patients' info" do
    it 'should display the name of patients over 18 years' do
      visit patients_path
      save_and_open_page
      expect(page).to have_content(pat_1.name)
      expect(page).to have_content(pat_2.name)
      expect(page).to have_content(pat_3.name)
      expect(page).to_not have_content(pat_4.name)
    end
  end
end