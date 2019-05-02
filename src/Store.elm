module Store exposing (Model, Msg(..), init, initModel, update, view)

import Html exposing (Html, a, article, br, div, figure, h1, img, p, small, strong, text, time)
import Html.Attributes exposing (alt, class, datetime, href, src)



---- MODEL ----


type alias Model =
    { name : String, image : Maybe String, address : String }


initModel : Model
initModel =
    { name = "", image = Nothing, address = "" }


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


viewLogo : Model -> Html Msg
viewLogo model =
    case model.image of
        Just logo ->
            div [ class "media-left" ]
                [ figure [ class "image is-64x64" ]
                    [ img [ alt model.name, src logo ]
                        []
                    ]
                ]

        Nothing ->
            div [] []


view : Model -> Html Msg
view model =
    div [ class "column is-4" ]
        [ div [ class "box" ]
            [ article [ class "media" ]
                [ viewLogo model
                , div [ class "media-content" ]
                    [ div [ class "content" ]
                        [ p []
                            [ strong []
                                [ text model.name ]
                            , br []
                                []
                            , text model.address
                            ]
                        ]
                    ]
                ]
            ]
        ]



-- div [ class "card" ]
--     [ div [ class "card-image" ]
--         [ figure [ class "image is-4by3" ]
--             [ img [ alt "Placeholder image", src "https://bulma.io/images/placeholders/1280x960.png" ]
--                 []
--             ]
--         ]
--     , div [ class "card-content" ]
--         [ div [ class "media" ]
--             [ div [ class "media-left" ]
--                 [ figure [ class "image is-48x48" ]
--                     [ img [ alt "Placeholder image", src "https://bulma.io/images/placeholders/96x96.png" ]
--                         []
--                     ]
--                 ]
--             , div [ class "media-content" ]
--                 [ p [ class "title is-4" ]
--                     [ text "John Smith" ]
--                 , p [ class "subtitle is-6" ]
--                     [ text "@johnsmith" ]
--                 ]
--             ]
--         , div [ class "content" ]
--             [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit.      Phasellus nec iaculis mauris. "
--             , a []
--                 [ text "@bulmaio" ]
--             , text ".      "
--             , a [ href "#" ]
--                 [ text "#css" ]
--             , a [ href "#" ]
--                 [ text "#responsive" ]
--             , br []
--                 []
--             , time [ datetime "2016-1-1" ]
--                 [ text "11:09 PM - 1 Jan 2016" ]
--             ]
--         ]
--     ]
