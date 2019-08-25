module Main exposing (Model, Msg(..), initialModel, update, view)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)
import MyTypes.MyOpaque as O exposing (MyOpaque(..), transformMyOpaque)
import MyTypes.MyTransparent as T exposing (MyTransparent(..))



{-
   This function can access to type constructors and deconstruct actual values
   as they are exposed by the MyTypes.MyTransparent module.
-}


myTransparentToString : MyTransparent -> String
myTransparentToString t =
    case t of
        MyTransparent1 _ ->
            "My Transparent 1"

        MyTransparent2 _ ->
            "My Transparent 2"



{-
   This function can't be defined as type constructor MyOpaque1 and MyOpaque2 are
   not exposed by the MyTypes.MyOpaque module.

   myOpaqueToString : MyOpaque -> String
   myOpaqueToString o =
       case o of
           MyOpaque1 _ ->
               "My Opaque 1"

           MyOpaque2 _ ->
               "My Opaque 2"
-}


type alias Model =
    { currentTransparent : MyTransparent
    , currentOpaque : MyOpaque
    }


initialModel : Model
initialModel =
    { currentTransparent = MyTransparent1 99 -- we can do that as MyTransparent is not opaque
    , currentOpaque = O.makeOpaque 99 -- this is the only way we can create a MyOpaque
    }


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "This is an opaque type" ]
        , text (myTransparentToString model.currentTransparent)
        , button [ onClick TrasformTrasparent ] [ text "Transform" ]
        , br [] []
        , text (O.toString model.currentOpaque)
        , button [ onClick TrasformOpaque ] [ text "Transform" ]
        ]


type Msg
    = TrasformTrasparent
    | TrasformOpaque


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- we are not importing transformMyTransparent directly, so we need to access this function thorugh the module alias 'T'
        TrasformTrasparent ->
            ( { model | currentTransparent = T.transformMyTransparent model.currentTransparent }, Cmd.none )

        -- we can call transformMyOpaque directly without the module alias 'O' as we imported his module exposing this function
        TrasformOpaque ->
            ( { model | currentOpaque = transformMyOpaque model.currentOpaque }, Cmd.none )


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> ( initialModel, Cmd.none )
        , subscriptions = \_ -> Sub.none
        , update = update
        , view = view
        }
