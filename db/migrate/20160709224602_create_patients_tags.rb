class CreatePatientsTags < ActiveRecord::Migration
  def change
    create_table :patients_tags do |t|
      t.integer :patient_id
      t.integer :tag_id
    end
  end
end
