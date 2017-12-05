class Api::V1::MessagesController < ApplicationController
    def index
        @messages = Message.all
        render json: @messages
    end

    def show
        @message = Message.find(params[:id])
        render json: @message
    end

    def create
        @message = Message.create(message_params)
    end

    def update
        @message = Message.find(params[:id])

        @message.update(message_params)
        if @message.save
            render json: @message
        else
            render json: {errors: @message.errors.full_messages}, status: 422
        end
    end

    private
    def message_params
        params.permit(:chat_id, :sender_name)
    end

end
