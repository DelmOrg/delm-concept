module Concept.DefaultValues exposing
        ( address
        , int )

{-| This is part of the standard library for Delm.

@docs address

@docs int

-}

import Concept.Core exposing (Address, zeroAddress)


{-| Address default value.

-}
address : Address
address =
    zeroAddress


{-| Integer default value.

-}
int : number
int =
    0
