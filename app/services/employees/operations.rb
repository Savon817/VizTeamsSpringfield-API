module Employees
    module Operations
        def self.new_employee(params, current_user)
            employee = current_user.employees.new(first_name: params[:first_name], last_name: params[:last_name], pictureUrl: params[:pictureUrl], job_ids: params[:job_ids], team_id: params[:team_id])
            return ServiceContract.success(employee) if employee.save
            ServiceContract.error(employee.errors.full_messages)
        end
        def self.update_employee(params)
            employee = Employee.find(params[:id])
            return ServiceContract.success(employee) if employee.update(first_name: params[:first_name], last_name: params[:last_name], pictureUrl: params[:pictureUrl], job_id: params[:job_id], team_id: params[:team_id])
            ServiceContract.error(employee.errors.full_messages)
        end
    end
end