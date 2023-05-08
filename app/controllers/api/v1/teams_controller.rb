module Api
    module V1
        class TeamsController < Api::V1::ApplicationController
            def create
                team = Team.new(name: params[:team][:name], description: params[:team][:description])
                if team.save
                    payload = {
                      team: TeamBlueprint.render_as_hash(team),
                      status: 200
                    }
                    render_success(payload: payload)
                  else
                    render_error(errors: team.errors.full_messages, status: 400)
                  end
            end

        end
    end
end