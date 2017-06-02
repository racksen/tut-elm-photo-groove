module Components.PhotoGrooveComp.View exposing (viewOrError)

import Html exposing (Html, div, h1, h3, img, text, button, span, label, input, p)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Components.PhotoGrooveComp.Model exposing (..)


viewOrError : Model -> Html Msg
viewOrError model =
    case model.loadingError of
        Nothing ->
            view model

        Just errorMessage ->
            div [ class "error-message" ]
                [ h1 [] [ text "Photo Groove" ]
                , p [] [ text errorMessage ]
                ]


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 []
            [ text "Photo Groove" ]
        , button
            [ onClick SURPRISE_ME ]
            [ text "Surprise Me!" ]
        , viewThumbnailSizeChooser model.chosenSize
        , viewThumbnails model
        , viewLargeThumbnail model.selectedPhotoUrl
        ]


viewThumbnails : Model -> Html Msg
viewThumbnails model =
    div [ id "thumbnails", class (thumbnailSizeToString model.chosenSize) ]
        (List.map
            (viewThumbnail model.selectedPhotoUrl)
            model.photos
        )


viewThumbnail : Maybe String -> Photo -> Html Msg
viewThumbnail selectedPhotoUrl thumbnail =
    let
        isUrlSelectedBefore =
            selectedPhotoUrl == Just thumbnail.url

        imgAttrib =
            [ src (urlPrefix ++ thumbnail.url)
            , classList [ ( "selected", isUrlSelectedBefore ) ]
            , onClick (SELECT_PHOTO_BY_URL thumbnail.url)
            ]
    in
        img imgAttrib []


viewLargeThumbnail : Maybe String -> Html Msg
viewLargeThumbnail selectedPhotoUrl =
    case selectedPhotoUrl of
        Just url ->
            img [ src (urlPrefix ++ "large/" ++ url), class "large" ]
                []

        Nothing ->
            text ""


viewThumbnailSizeChooser : ThumbnailSize -> Html Msg
viewThumbnailSizeChooser chosenSize =
    span []
        [ h3 [] [ text "Thumbnail Size: " ]
        , div [ id "choose_size" ]
            (List.map (viewRadioBtnForThumbnailSizeChooser chosenSize) [ Small, Medium, Large ])
        ]


viewRadioBtnForThumbnailSizeChooser : ThumbnailSize -> ThumbnailSize -> Html Msg
viewRadioBtnForThumbnailSizeChooser chosenSize size =
    label []
        [ input
            [ type_ "radio"
            , name "size"
            , onClick (SET_THUMBNAIL_SIZE size)
            , checked (chosenSize == size)
            ]
            []
        , text (thumbnailSizeToString size)
        ]
