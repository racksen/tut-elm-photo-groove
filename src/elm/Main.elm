module Main exposing (main)

import Html exposing (Html)


-- component import example

import Components.PhotoGrooveComp.View exposing (viewOrError)
import Components.PhotoGrooveComp.Model exposing (Model, initialModel, initialCmd, Msg)
import Components.PhotoGrooveComp.Update exposing (update)


-- APP


main : Program Never Model Msg
main =
    Html.program
        { init = ( initialModel, initialCmd )
        , view = viewOrError
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }
