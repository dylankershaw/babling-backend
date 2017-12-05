class Api::V1::TranslationsController < ApplicationController

    translator = Yandex::Translator.new('trnsl.1.1.20171204T203148Z.edb25d6878d750e4.eb231d93b0ca2ae6937947ed9a0188df3a07ca10')

    def show
        @translation = Translation.find(params[:id])
        render json: @translation
    end
    
    def translate(text, fromLang, toLang)
        translator.translate text, from: fromLang, to: toLang
    end

    def create
        @translation = Translation.create(translation_params)
        # associate the translation with the message
        Message.last.translations << @translation
        # translate the message to every other language in the chat.languages array
        (@translation.message.chat.languages - [@translation.language]).each do |language|
            # fetch the yandex api and instantiate the result as a new translation
            translation = translator.translate @translation.text, from: @translation.language, to: language
            binding.pry
            # relate that new translation to the message
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
