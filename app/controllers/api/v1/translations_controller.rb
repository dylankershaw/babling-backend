class Api::V1::TranslationsController < ApplicationController

    def show
        @translation = Translation.find(params[:id])
        render json: @translation
    end

    def create
        @translation = Translation.create(translation_params)
        # associate the translation with the message
        @translation.message = Message.last
    end

    def update
        @translation = Translation.find(params[:id])

        @translation.update(translation_params)
        if @translation.save
            render json: @translation
        else
            render json: {errors: @translation.errors.full_messages}, status: 422
        end
    end

    private
    def translation_params
        params.permit(:message_id, :language, :text)
    end

end
