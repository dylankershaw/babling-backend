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
        @chat.languages << "en" if @chat.languages.length === 0
        user1 = User.find(params["user1id"])
        user2 = User.find(params["user2id"])
        @chat.users << user1
        @chat.users << user2
        @chat.save
    end

    def update
        @chat = Chat.find(params[:id])
        language = chat_params["languages"]
        
        # iterate through each of the chat's messages and translate to the new language
        @chat.messages.each do |message|
            
            # returns true if the message does not already have a translation in the new language
            if !@chat.languages.include?(language)
                
                # translates the text 
                translated_text = @@translator.translate message.translations.first.text, from: message.translations.first.language, to: language

                # create the translation
                new_translation = Translation.create(
                    language: language,
                    message_id: message.id,
                    text: translated_text
                )
                
                # associate the translation with the message
                message.translations << new_translation

            end
            
        end

        # adds the language to the chat if it doesn't already have it
        if !@chat.languages.include?(language)
            @chat.languages << language
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
