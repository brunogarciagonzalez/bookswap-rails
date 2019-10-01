class SessionsController < ApplicationController

    def create
        byebug
        found = User.find_by(username: params[:username])
        if found && found.authenticate(params[:password])
            render json: found
        else
            byebug
        end
    end

    def destroy
        byebug
    end
end
