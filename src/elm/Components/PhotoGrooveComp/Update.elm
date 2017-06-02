module Components.PhotoGrooveComp.Update exposing (update)

import Components.PhotoGrooveComp.Model exposing (..)
import Random


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SELECT_PHOTO_BY_URL url ->
            ( { model | selectedPhotoUrl = Just url }, Cmd.none )

        SELECT_PHOTO_BY_INDEX index ->
            ( { model | selectedPhotoUrl = (getPhotoUrlByIndex index model.photos) }, Cmd.none )

        SURPRISE_ME ->
            ( model, Random.generate SELECT_PHOTO_BY_INDEX (randomGeneratorToPickPhoto model.photos) )

        SET_THUMBNAIL_SIZE size ->
            ( { model | chosenSize = size }, Cmd.none )

        LOAD_PHOTOS (Ok photos) ->
            ( { model
                | photos = photos
                , selectedPhotoUrl = Maybe.map .url (List.head photos)
              }
            , Cmd.none
            )

        LOAD_PHOTOS (Err _) ->
            ( { model
                | loadingError = Just "Loading Error!"
              }
            , Cmd.none
            )
