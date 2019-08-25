module MyTypes.MyTaggedTypes exposing (Type1, Type2, Type3, calc, makeType2)

import MyTypes.MyTagged as MyTagged exposing (MyTagged(..))


type Type1Tag
    = Type1_Unused


type Type2Tag
    = Type2_Unused


type Type3Tag
    = Type3_Unused


type alias Type1 =
    MyTagged Type1Tag Float


type alias Type2 =
    MyTagged Type2Tag Int


type alias Type3 =
    MyTagged Type3Tag Int


makeType1 : Float -> Type1
makeType1 =
    MyTagged


makeType2 : Int -> Type2
makeType2 =
    MyTagged


makeType3 : Int -> Type3
makeType3 =
    MyTagged


calc : Type2 -> Type3
calc drips =
    let
        ff x =
            x + 1
    in
    MyTagged.map ff drips |> MyTagged.retag
