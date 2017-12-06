class Api::V1::UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def login
        @user = User.find_by(username: params[:username].downcase)
        if @user.password === params[:password]
            render json: @user
        else
            render status: 401
        end
    end

    def create
        
        #### DOWNCASE USERNAME BEFORE CREATING

        @user = User.create(user_params)
    end

    def update
        @user = User.find(params[:id])

        @user.update(user_params)
        if @user.save
            render json: @user
        else
            render json: {errors: @user.errors.full_messages}, status: 422
        end
    end

    private
    def user_params
        params.permit(:username, :password)
    end

end
