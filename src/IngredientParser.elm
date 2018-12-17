module IngredientParser exposing (Ingredient, parse)

import Parser exposing ((|.), (|=), Parser, Step, chompWhile, float, getChompedString, loop, spaces, succeed, symbol)


type alias Ingredient =
    { quantity : String
    }


parseLine : Parser Ingredient
parseLine =
    succeed Ingredient
        |= (getChompedString <| chompWhile Char.isDigit)


parse : String -> Ingredient
parse input =
    case Parser.run parseLine input of
        Err err ->
            Ingredient "A"

        Ok result ->
            result
