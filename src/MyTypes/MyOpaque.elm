module MyTypes.MyOpaque exposing (MyOpaque, makeOpaque, toString, transformMyOpaque)


type MyOpaque
    = MyOpaque1 Int
    | MyOpaque2 Int


makeOpaque : Int -> MyOpaque
makeOpaque x =
    MyOpaque1 x


transformMyOpaque : MyOpaque -> MyOpaque
transformMyOpaque a =
    case a of
        MyOpaque1 x ->
            MyOpaque2 x

        MyOpaque2 x ->
            MyOpaque1 x


toString : MyOpaque -> String
toString a =
    case a of
        MyOpaque1 _ ->
            "My Opaque 1"

        MyOpaque2 _ ->
            "My Opaque 2"
