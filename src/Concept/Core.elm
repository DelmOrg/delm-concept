module Concept.Core exposing
        ( Requirements
        , Address
        , PayableAddress
        , zeroAddress
        , throw
        , Msg
        , Block
        , Tx
        , Global )


{-| This is part of the standard library for Delm.

@docs Requirements

@docs Address

@docs PayableAddress

@docs zeroAddress

@docs throw

@docs Msg

@docs Block

@docs Tx

@docs Global

-}

{-| Validation for Contracts.

-}
type alias Requirements =
    List ( Bool, String )


{-| Address is a unique identification of a Wallet or Contract in a blockchain.

-}
type alias Address =
    String


{-| A Payable Address is an Address that can be used to send Ether.

-}
type alias PayableAddress =
    String


{-| The Zero Address is a special Address that can be handy for burning tokens.

-}
zeroAddress : String
zeroAddress =
    "0x0000000000000000000000000000000000000000"


{-| Helper function to throw an error.

-}
throw : String -> a
throw =
    Debug.todo


{-| Receiving Message.

-}
type alias Msg =
    { sender : PayableAddress
    , data : String
    , sig : String
    , value : Int
    }


{-| An individual block information.

-}
type alias Block =
    { coinbase : Address
    , difficulty : Int
    , gasLimit : Int
    , number : Int
    , timestamp : Int
    }


{-| Transaction information.

-}
type alias Tx =
    { gasPrice : Int
    , origin : Address
    }


{-| Global information.

-}
type alias Global =
    { msg : Msg, block : Block }
