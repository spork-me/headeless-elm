module IngredientParserTest exposing (suite)

import Expect exposing (Expectation)
import IngredientParser exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Parsing"
        [ test "parses int / unit / description" <|
            \() ->
                Expect.equal
                    (IngredientParser.parse "12 cup salt and pepper")
                    (Ingredient "12" "cup" "salt and pepper")
        , test "parse with float quantity" <|
            \() ->
                Expect.equal
                    (IngredientParser.parse "1.5 packets salt and pepper")
                    (Ingredient "1.5" "packets" "salt and pepper")
        , todo "parse with rational number"
        , todo "parse without quantity"
        ]
