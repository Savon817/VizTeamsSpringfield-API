module Api
    module V1
        class JobsController < Api::V1::ApplicationController

            def show
                jobs = Job.find(params[:id])
      
                payload = {
                  job: JobBlueprint.render_as_hash(jobs),
                    status: 200
                }
                render_success(payload: payload)
              end
        end
    end
end