class Api::V1::UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: {
            status: 200,
            statusText: "Successfully created user",
            headers['Header-Name'] = 'header value',
            user: @user
            }.to_json
        else
            render json: {
            status: 500,
            errors: list.errors
            }.to_json
        end
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
