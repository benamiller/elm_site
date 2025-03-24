module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html, div, h1, text)
import Url exposing (Url)



-- MODEL


type alias Model =
    { key : Nav.Key, currentPage : Page }


type Page
    = Home
    | About
    | Portfolio


init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( { key = key, currentPage = urlToPage url }, Cmd.none )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | currentPage = urlToPage url }, Cmd.none )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    div []
        [ h1 [] [ text model.title ]
        , text "Hello"
        ]



-- PROGRAM


main =
    Browser.sandbox { init = init, update = update, view = view }
