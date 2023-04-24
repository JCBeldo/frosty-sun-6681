require 'rails_helper'

RSpec.describe 'doctor show page' do
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

  describe 'displays the doctors info, including name, specialty, university, hospital, and patients' do
    it 'should display the name, specialty, and university' do
      visit doctor_path(doc_1)

      expect(page).to have_content(doc_1.name)
      expect(page).to have_content(doc_1.specialty)
      expect(page).to have_content(doc_1.university)
      
      expect(page).to_not have_content(doc_4.name)
      expect(page).to_not have_content(doc_4.specialty)
      expect(page).to_not have_content(doc_4.university)
    end

    it 'should display the name of the hospital where they work' do
      visit doctor_path(doc_2)
     
      expect(page).to have_content("Seaside Health & Wellness Center")

      visit doctor_path(doc_4)

      expect(page).to have_content("Grey Sloan Memorial Hospital")
    end

    it 'should display the names of the doctors patients' do
      visit doctor_path(doc_1)
      
      expect(page).to have_content("Katie Bryce")
      expect(page).to have_content("Denny Duquette")
    end
  end
end

 # save_and_open_page