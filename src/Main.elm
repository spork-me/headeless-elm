module Main exposing (main)

import Browser
import Html exposing (..)


type alias Model =
    Int


type Msg
    = Noop


init : () -> ( Model, Cmd Msg )
init _ =
    ( 999, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div [] []


main =
    Browser.element
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
