class SessionsController < ApplicationController

    def create
        byebug
        found_user = User.find_by(username: params[:username])
        if found_user && found_user.authenticate(params[:password])
            render json: UserSerializer.new(found_user).to_serialized_json
        else
            byebug
        end
    end

    def destroy
        byebug
    end
end
