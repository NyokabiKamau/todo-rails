class UsersController < ApplicationController

    def index
        user = User.all
        render json: { data: user }
    end

    def create
        user = User.create(user_params)
        cookies[:email] = user.email
        render json: { data: user, message: "User sucessfully created"}
    end

    def update
        id = params[:id].to_i
        user = User.find(id)
        user.update(user_params)
        render json: {message: "User sucessfully updated"}
    end

    def login
        email = params[:email]
        session[:email] = email
        render json: { message: "You are logged out" }
    end

    # Add Logout

    def logout
        email = params[:email]
        session[:email] = 
    end

    # TODO delete, show
    
    private
    
    def user_params
        params.permit(:email, :password)
    end
end
