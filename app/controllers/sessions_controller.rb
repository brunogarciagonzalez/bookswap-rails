class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            render json: {
                    success: true, 
                    user: user.id_and_username,
                    token: generate_token(user)
                 }     
        else
              render json: { success: false } 
        end
    end

    def destroy
        byebug
    end

    private
    def generate_token(user)
        alg = 'HS256'
        secret = 'password123'
        payload = { user_id: user.id }
        JWT.encode(payload, secret, alg)
    end
end
