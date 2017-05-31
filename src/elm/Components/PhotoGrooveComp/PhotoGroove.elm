module Components.PhotoGrooveComp.PhotoGroove exposing (..)

import Html exposing (Html, div, h1, img, text)
import Html.Attributes exposing (..)


photogroove : a -> Html a
photogroove model =
    div [ class "container" ]
        [ h1 [] [ text "Photo Groove" ]
        , div [ id "thumbnails" ]
            [ img [ src "http://elm-in-action.com/1.jpeg" ] []
            , img [ src "http://elm-in-action.com/2.jpeg" ] []
            , img [ src "http://elm-in-action.com/3.jpeg" ] []
            ]
        ]
