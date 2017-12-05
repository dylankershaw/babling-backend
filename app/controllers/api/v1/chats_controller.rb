class Api::V1::ChatsController < ApplicationController

    @@translator = Yandex::Translator.new('trnsl.1.1.20171204T203148Z.edb25d6878d750e4.eb231d93b0ca2ae6937947ed9a0188df3a07ca10')

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
        if @chat.languages.length === 0
            @chat.languages << "en"
            @chat.save
        end
    end

    def update
        @chat = Chat.find(params[:id])
        
        # iterate through each of the chat's messages and translate to the new language
        @chat.messages.each do |message|
            # check to see if the message already has a translation in that language
            if !@chat.languages.include?(params["languages"])
                # translate the message to french
                translated_text = @@translator.translate message.translations.first.text, from: message.translations.first.language, to: chat_params["languages"]
                language = chat_params["languages"]

                # create the translation
                new_translation = Translation.create(
                    language: language,
                    message_id: message.id,
                    text: translated_text
                )
                
                # associate the translation with the message
                message.translations << new_translation
                message.save # is this necessary?

                @chat.languages << language
                @chat.save # is this necessary?
            end

        end

        # @chat.update(chat_params)
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
