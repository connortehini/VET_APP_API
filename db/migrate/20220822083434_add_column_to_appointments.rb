class AddColumnToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_reference :appointments, :registration, foreign_key: true
  end
end
