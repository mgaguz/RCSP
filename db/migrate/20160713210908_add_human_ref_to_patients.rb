class AddHumanRefToPatients < ActiveRecord::Migration
  def change
    add_reference :patients, :human, index: true, foreign_key: true
  end
end
