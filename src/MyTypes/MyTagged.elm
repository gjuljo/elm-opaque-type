module MyTypes.MyTagged exposing (MyTagged(..), map, map2, retag, untag)


type MyTagged tag a
    = MyTagged a


untag : MyTagged tag a -> a
untag (MyTagged x) =
    x


retag : MyTagged tag1 a -> MyTagged tag2 a
retag (MyTagged x) =
    MyTagged x


map : (a -> b) -> MyTagged tag a -> MyTagged tag b
map f (MyTagged x) =
    MyTagged (f x)


map2 : (a -> b -> c) -> MyTagged tag a -> MyTagged tag b -> MyTagged tag c
map2 f (MyTagged x) (MyTagged y) =
    MyTagged (f x y)
