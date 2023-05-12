class AddTeamRefToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :team, null: false, foreign_key: true
  end
end
