module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Html exposing (Html, a, div, h1, text)
import Html.Attributes exposing (class, id)
import Html.Events exposing (onClick)
import Url exposing (Url)



-- MODEL


type alias Model =
    { key : Nav.Key, currentPage : Page }


type Page
    = Home
    | About
    | Projects


init : () -> Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    ( { key = key, currentPage = urlToPage url }, Cmd.none )



-- UPDATE


type Msg
    = Navigate String
    | UrlChanged Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Navigate path ->
            ( model, Nav.pushUrl model.key path )

        UrlChanged url ->
            ( { model | currentPage = urlToPage url }, Cmd.none )



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Ben"
    , body =
        [ div []
            [ navigation
            , pageContent model.currentPage
            ]
        ]
    }


navigation : Html Msg
navigation =
    div []
        [ a [ onClick (Navigate "/"), class "nav-item", id "home-link" ] [ text "Home" ]
        , text " | "
        , a [ onClick (Navigate "/about"), class "nav-item" ] [ text "About" ]
        , text " | "
        , a [ onClick (Navigate "/projects"), class "nav-item" ] [ text "Projects" ]
        ]


pageContent : Page -> Html Msg
pageContent page =
    case page of
        Home ->
            div [] [ h1 [] [ text "Home" ], text "Welcome" ]

        About ->
            div [] [ h1 [] [ text "About" ], text "This is about." ]

        Projects ->
            div [] [ h1 [] [ text "Projects" ], text "These are projects" ]



-- ROUTING


urlToPage : Url -> Page
urlToPage url =
    case url.path of
        "/about" ->
            About

        "/projects" ->
            Projects

        _ ->
            Home



-- PROGRAM


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlRequest =
            \urlRequest ->
                case urlRequest of
                    Browser.Internal url ->
                        Navigate (Url.toString url)

                    Browser.External _ ->
                        Navigate "/"
        , onUrlChange = UrlChanged
        }
