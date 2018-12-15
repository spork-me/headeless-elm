port module Main exposing (main)

import Browser
import Html exposing (..)
import Json.Encode as E
import Json.Decode as D


type alias Model =
    String


type Msg
    = GotJSValue E.Value


init : () -> ( Model, Cmd Msg )
init _ =
    ( "", Cmd.none )

port intoElm : (E.Value -> msg) -> Sub msg



subscriptions : Model -> Sub Msg
subscriptions _ =
    intoElm GotJSValue

port outOfElm : E.Value -> Cmd msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotJSValue value ->
            -- figure out what JS sent
            case D.decodeValue D.int value of
                Err err ->
                    (model, Cmd.none)
                Ok decoded ->
                    -- perform a calculation
                    -- send it back through port
                    (model , outOfElm (E.int decoded))


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
