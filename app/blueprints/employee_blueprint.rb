class EmployeeBlueprint < Blueprinter::Base
    identifier :id
    fields :first_name, :last_name, :job_titles
end