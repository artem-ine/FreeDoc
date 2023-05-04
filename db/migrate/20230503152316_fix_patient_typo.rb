class FixPatientTypo < ActiveRecord::Migration[7.0]
  def change
    rename_column(:patients, :fist_name, :first_name)
  end
end
