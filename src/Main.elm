module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Html, a, div, h1, img, nav, section, span, text)
import Html.Attributes exposing (attribute, class, href, src)
import Store



---- MODEL ----


type alias Flags =
    { stores : List Store.Model }


type alias Model =
    { stores : List Store.Model }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { stores = flags.stores }, Cmd.none )



---- UPDATE ----


type Msg
    = StoreMsg Int Store.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


renderNavBar : Html Msg
renderNavBar =
    nav [ attribute "aria-label" "main navigation", class "navbar", attribute "role" "navigation" ]
        [ div [ class "navbar-brand" ]
            [ a [ class "navbar-item", href "" ]
                [ h1 [] [ text "No Billing without Mobile" ]
                ]
            , a [ attribute "aria-expanded" "false", attribute "aria-label" "menu", class "navbar-burger burger", attribute "data-target" "navbarBasicExample", attribute "role" "button" ]
                [ span [ attribute "aria-hidden" "true" ]
                    []
                , span [ attribute "aria-hidden" "true" ]
                    []
                , span [ attribute "aria-hidden" "true" ]
                    []
                ]
            ]
        ]


view : Model -> Html Msg
view model =
    section [ class "section" ]
        [ div [ class "container" ]
            [ renderNavBar
            , div [ class "columns" ]
                (List.indexedMap (\index store -> Html.map (StoreMsg index) (Store.view store)) model.stores)
            ]
        ]



---- PROGRAM ----


main : Program Flags Model Msg
main =
    Browser.element
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
