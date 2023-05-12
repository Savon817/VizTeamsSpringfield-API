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
        end
    end
end