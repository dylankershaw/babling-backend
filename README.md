### [click here for babling-frontend](https://github.com/dylankershaw/babling-frontend)

# Babling
A live chat app that auto-translates messages so users who speak different languages can communicate in real time. Translations are handled via the [Yandex Translate API](https://tech.yandex.com/translate/).

## Key Technologies, Packages, and Gems
* Front End
  * React
  * react-router-dom
  * semantic-ui-react
* Back End
  * Rails
  * yandex-translator
  
## Core Features
* Dynamic translations so new and existing messages are translated on language change
* Ajax polling that enables live chat functionality
* Client-side routing with React Router
* RESTful Rails API built using MVC pattern

## Demo
![selecting a chat](https://media.giphy.com/media/l0HUjM8gM7S5fKAiQ/giphy.gif)

Users can select from existing chats or start a new one. All chats are persisted and stored on API.

<br />

![message polling](https://media.giphy.com/media/3o75209z1ytFfQlANq/giphy.gif)

Chats are polled every second to make sending and receiving messages nearly instantaenous.

<br />

![language change](https://media.giphy.com/media/l0HTZKcvw96BQJp5K/giphy.gif)

Chat language can be changed on the fly. Every message gets automatically translated into that language if it has not previously been selected. Once it has been translated, its translation remains on the database for fast subsequent language switching. [See here for code](https://github.com/dylankershaw/babling-backend/blob/master/app/controllers/api/v1/chats_controller.rb) (see the Update action).

<br />

![sending message in French](https://media.giphy.com/media/3o751SbSCzKXfPHDb2/giphy.gif)

Each user can use a different language.

<br />

![sending message in Icelandic](https://media.giphy.com/media/3o752dheaB2SUqBDyM/giphy.gif)

And translate the entire chat in real-time.
