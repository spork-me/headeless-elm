port module Main exposing (main)

import Browser
import Html exposing (..)
import Json.Encode as E
import Json.Decode as D

type alias Model = String

type Msg = GotJSValue E.Value

init : () -> ( Model, Cmd Msg )
init _ = ( "", Cmd.none )

port intoElm : (E.Value -> msg) -> Sub msg

subscriptions : Model -> Sub Msg
subscriptions _ =
    intoElm GotJSValue

port outOfElm : E.Value -> Cmd msg

--
type alias Measurement =
    { quantity : String
    , unit: String
    , desc: String
    }

parseMeasurement : String -> Measurement
parseMeasurement input =
    { quantity = "1"
    , unit = "LB"
    , desc = "butter"
    }

encodeMeasurement : Measurement -> E.Value
encodeMeasurement measurement =
    E.object
        [ ("quantity", E.string measurement.quantity)
        , ("unit", E.string measurement.unit)
        , ("desc", E.string measurement.desc)
        ]

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotJSValue value ->
            case D.decodeValue D.string value of
                Err err ->
                    (D.errorToString err, Cmd.none)

                Ok decoded ->
                    (model , parseMeasurement decoded |> encodeMeasurement |> outOfElm)


view : Model -> Html Msg
view _ =
    div [] []


main =
    Browser.element
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
