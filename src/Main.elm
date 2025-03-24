module Main exposing (main)

import Browser
import Html exposing (Html, div, h1, text)

-- MODEL
type alias Model = { title : String }

init : Model
init = { title = "Ben" }

-- UPDATE
type Msg = NoOp

update : Msg -> Model -> Model
update msg model = model

-- VIEW
view : Model -> Html Msg
view model = 
        div []
                [ h1 [] [ text model.title ]
                , text "Hello"
                ]

-- PROGRAM
main = Browser.sandbox { init = init, update = update, view = view }
