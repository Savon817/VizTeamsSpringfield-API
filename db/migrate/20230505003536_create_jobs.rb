class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.text :job_titles

      t.timestamps
    end
  end
end
