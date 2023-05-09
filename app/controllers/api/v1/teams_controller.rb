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

            def index
                teams = Team.all
                payload = {
                    teams: TeamBlueprint.render_as_hash(teams),
                    status: 200
                }
                render_success(payload: payload)
            end
            
            def show
                team = Team.find(params[:id])
                payload = {
                    team: TeamBlueprint.render_as_hash(team),
                    status: 200
                }
                render_success(payload: payload)
            end
            
            def update
                result = Teams::Operations.update_team(params)
                render_error(errors: result.errors.all, status: 400) and return unless result.success?
                payload = {
                    team: TeamBlueprint.render_as_hash(result.payload),
                    status: 201
                }
                render_success(payload: payload)
            end

            def destroy
                team = Team.find(params[:id])
                team.destroy
                render_success(payload: "Team has been deleted!", status: 200)
            end

        end
    end
end