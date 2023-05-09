module Teams
    module Operations
        def self.new_team(params, current_user)
            team = current_user.teams.new(name: params[:name], description: params[:description], user_id: params[:user_id])
            return ServiceContract.success(team) if team.save
            ServiceContract.error(team.errors.full_messages)
        end
        def self.update_team(params)
            team = Team.find(params[:id])
            return ServiceContract.success(team) if team.update(name: params[:name], description: params[:description])
            ServiceContract.error(team.errors.full_messages)
        end
    end
end