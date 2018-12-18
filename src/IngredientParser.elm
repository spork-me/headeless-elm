module IngredientParser exposing (Ingredient, parse)

import Parser exposing ((|.), (|=), Parser, Step, chompWhile, float, getChompedString, loop, spaces, succeed, symbol)


type alias Ingredient =
    { quantity : String
    , unit : String
    , desc : String
    }


parseUnit : Parser String
parseUnit =
    getChompedString <|
        succeed ()
            |. chompWhile (\c -> Char.isDigit c || c == '.' || c == '/')



-- parseLine : Parser a


parseLine : Parser Ingredient
parseLine =
    succeed Ingredient
        |= parseUnit
        |. chompWhile (\c -> c /= ' ')
        |. chompWhile (\c -> c == ' ')
        |= (getChompedString <| chompWhile (\c -> c /= ' '))
        |. spaces
        |= (getChompedString <| chompWhile (\c -> c /= '\n' || c /= '\u{000D}'))


parse : String -> Ingredient
parse input =
    case Parser.run parseLine input of
        Err err ->
            Ingredient "A" "B" "C"

        Ok result ->
            if String.isEmpty result.quantity then
                Ingredient "1" "EA" input

            else
                result
