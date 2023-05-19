# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Job.create(job_titles: ["Software Engineer", "Software Quality Engineer", "Director, Software Engineering", "Business Analyst", "Product Owner", "UX Designer"])

# Job.create(job_titles: "Software Engineer")
Job.create(job_titles: "Software Quality Engineer")
Job.create(job_titles: "Director, Software Engineering")
Job.create(job_titles: "Business Analyst")
Job.create(job_titles: "Product Owner")
Job.create(job_titles: "UX Designer")

# defining teams
teams = [
    {
      name: 'Team A',
      description: 'Description of Team A',
      employees: [
        { first_name: 'John', last_name: 'Doe' },
        { first_name: 'Jane', last_name: 'Smith' },
        { first_name: 'Mike', last_name: 'Johnson' }
      ]
    },
    {
      name: 'Team B',
      description: 'Description of Team B',
      employees: [
        { first_name: 'Alice', last_name: 'Williams' },
        { first_name: 'Bob', last_name: 'Brown' },
        { first_name: 'Johnny', last_name: 'Cash' }
      ]
    }
  ]
  # creating teams and their employees
  teams.each do |team_data|
    team = Team.create(name: team_data[:name], description: team_data[:description])
    team_data[:employees].each do |employee_data|
      team.employees.create(first_name: employee_data[:first_name], last_name: employee_data[:last_name])
    end
  end