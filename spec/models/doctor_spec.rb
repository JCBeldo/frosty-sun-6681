require 'rails_helper'

RSpec.describe Doctor do
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

  describe 'relationships' do
    it { should belong_to :hospital }
    it { should have_many :doctor_patients}
    it { should have_many(:patients).through(:doctor_patients)}
  end
  
  describe 'instance methods' do
    it '#hospital_name' do
      expect(doc_1.hospital_name).to eq("Grey Sloan Memorial Hospital")
      expect(doc_2.hospital_name).to eq("Seaside Health & Wellness Center")
    end
  end
end
