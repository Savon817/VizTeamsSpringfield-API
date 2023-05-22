class TeamBlueprint < Blueprinter::Base
    identifier :id
    fields :name, :description, :employees

    association :employees, blueprint: EmployeeBlueprint
end