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
        , test "parse with rational quantity" <|
            \() ->
                Expect.equal
                    (IngredientParser.parse "2/3 cup concrete aggregate")
                    (Ingredient "2/3" "cup" "concrete aggregate")
        , test "parse with bad quantity" <|
            \() ->
                Expect.equal
                    (IngredientParser.parse "2/3e12 cup concrete aggregate")
                    (Ingredient "2/3" "cup" "concrete aggregate")
        , test "parse with no quantity" <|
            \() ->
                Expect.equal
                    (IngredientParser.parse "season beef overnight")
                    (Ingredient "1" "EA" "season beef overnight")
        ]
