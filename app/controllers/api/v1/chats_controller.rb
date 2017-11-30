class Api::V1::ChatsController < ApplicationController

    def index
        @chats = Chat.all
        render json: @chats
    end

    def show
        @chat = Chat.find(params[:id])
        render json: @chat
    end

    def create
        @chat = Chat.create(chat_params)
    end

    def update
        @chat = Chat.find(params[:id])

        @chat.update(chat_params)
        if @chat.save
            render json: @chat
        else
            render json: {errors: @chat.errors.full_messages}, status: 422
        end
    end

    private
    def chat_params
        params.permit(:languages)
    end

end
