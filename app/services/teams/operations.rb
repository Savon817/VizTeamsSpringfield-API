module Teams
    module Operations
        def self.new_team(params, current_user)
            team = current_user.teams.new(name: params[:name], description: params[:description], user_id: params[:user_id])
            return ServiceContract.success(team) if team.save
            ServiceContract.error(team.errors.full_messages)
        end
        def self.update_book(params)
            book = Book.find(params[:id])
            return ServiceContract.success(book) if book.update(title: params[:title], summary: params[:summary], image_path: params[:image_path], category_ids: params[:category_ids], author_ids: params[:author_ids])
            ServiceContract.error(book.errors.full_messages)
        end
    end
end