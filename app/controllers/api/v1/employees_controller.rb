module Api
    module V1
        class EmployeesController < Api::V1::ApplicationController
            def create
                employee = Employee.new(first_name: params[:employee][:first_name], last_name: params[:employee][:last_name], pictureUrl: params[:employee][:pictureUrl], job_id: params[:employee][:job_id], team_id: params[:employee][:team_id])
                if employee.save
                    payload = {
                      employee: EmployeeBlueprint.render_as_hash(employee),
                      status: 200
                    }
                    render_success(payload: payload)
                  else
                    render_error(errors: employee.errors.full_messages, status: 400)
                  end

            end

            def index
                employees = Employee.all
                payload = {
                    employees: EmployeeBlueprint.render_as_hash(employees),
                    status: 200
                }
                render_success(payload: payload)
            end
            
            def show
                employee = Employee.find(params[:id])
                payload = {
                    employee: EmployeeBlueprint.render_as_hash(employee),
                    status: 200
                }
                render_success(payload: payload)
            end
            
            def update
                result = Employees::Operations.update_employee(params)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    employee: EmployeeBlueprint.render_as_hash(result.payload),
                    status: 201
                }
                render_success(payload: payload)
            end

            def destroy
                employee = Employee.find(params[:id])
                employee.destroy
                render_success(payload: "Employee has been deleted!", status: 200)
            end
        end
    end
end