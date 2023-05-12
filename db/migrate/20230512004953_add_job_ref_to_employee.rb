class AddJobRefToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :job, null: false, foreign_key: true
  end
end
