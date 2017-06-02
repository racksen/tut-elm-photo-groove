module Components.PhotoGrooveComp.Model exposing (..)

import Array exposing (Array)
import Http
import Random
import Json.Decode exposing (string, int, list, Decoder)
import Json.Decode.Pipeline exposing (decode, required, optional)


urlPrefix : String
urlPrefix =
    "http://elm-in-action.com/"


urlGet : String
urlGet =
    "http://elm-in-action.com/photos/list.json"


type alias Photo =
    { url : String
    , size : Int
    , title : String
    }


type alias Model =
    { photos : List Photo
    , selectedPhotoUrl : Maybe String
    , loadingError : Maybe String
    , chosenSize : ThumbnailSize
    }


type Msg
    = SELECT_PHOTO_BY_URL String
    | SELECT_PHOTO_BY_INDEX Int
    | SURPRISE_ME
    | SET_THUMBNAIL_SIZE ThumbnailSize
    | LOAD_PHOTOS (Result Http.Error (List Photo))


type ThumbnailSize
    = Small
    | Medium
    | Large


initialModel : Model
initialModel =
    { photos = []

    -- [ { url = "1.jpeg" }
    -- , { url = "2.jpeg" }
    -- , { url = "3.jpeg" }
    -- , { url = "4.jpeg" }
    -- ]
    , selectedPhotoUrl = Nothing
    , loadingError = Nothing
    , chosenSize = Medium
    }


initialCmd : Cmd Msg
initialCmd =
    list photoDecoder
        |> Http.get urlGet
        |> Http.send LOAD_PHOTOS


thumbnailSizeToString : ThumbnailSize -> String
thumbnailSizeToString size =
    case size of
        Small ->
            "small"

        Medium ->
            "med"

        Large ->
            "large"


randomGeneratorToPickPhoto : List Photo -> Random.Generator Int
randomGeneratorToPickPhoto photos =
    Random.int 0 ((List.length photos) - 1)


getPhotoUrlByIndex : Int -> List Photo -> Maybe String
getPhotoUrlByIndex index photos =
    photos
        |> Array.fromList
        |> Array.get index
        |> Maybe.map .url


photoDecoder : Decoder Photo
photoDecoder =
    decode Photo
        |> required "url" string
        |> required "size" int
        |> optional "title" string "(untitled)"
