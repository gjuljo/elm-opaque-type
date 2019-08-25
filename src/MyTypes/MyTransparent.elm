module MyTypes.MyTransparent exposing (MyTransparent(..), toString, transformMyTransparent)


type MyTransparent
    = MyTransparent1 Int
    | MyTransparent2 Int


transformMyTransparent : MyTransparent -> MyTransparent
transformMyTransparent a =
    case a of
        MyTransparent1 x ->
            MyTransparent2 x

        MyTransparent2 x ->
            MyTransparent1 x


toString : MyTransparent -> String
toString a =
    case a of
        MyTransparent1 _ ->
            "My Transparent 1"

        MyTransparent2 _ ->
            "My Transparent 2"
