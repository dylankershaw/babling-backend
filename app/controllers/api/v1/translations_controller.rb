class Api::V1::TranslationsController < ApplicationController

    @@translator = Yandex::Translator.new('trnsl.1.1.20171204T203148Z.edb25d6878d750e4.eb231d93b0ca2ae6937947ed9a0188df3a07ca10')

    def show
        @translation = Translation.find(params[:id])
        render json: @translation
    end

    def create()
        @translation = Translation.create(translation_params)
        # associate the translation with the message
        Message.last.translations << @translation
        # translate the message to every other language in the chat.languages array
        (@translation.message.chat.languages - [@translation.language]).each do |language|
            text = @translation.text
            fromLang = @translation.language
            toLang = language
            translation = @@translator.translate text, from: fromLang, to: toLang
            # instantiate the translation
            new_translation = Translation.create(
                message_id: @translation.message.id,
                language: toLang,
                text: translation
            )
            # associate the new translation with the message
            @translation.message.translations << new_translation
        end
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
