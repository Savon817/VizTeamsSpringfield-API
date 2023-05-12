class EmployeeBlueprint < Blueprinter::Base
    identifier :id
    fields :first_name, :last_name, :pictureUrl, :job, :team
end