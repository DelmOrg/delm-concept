module Concept.Mapping exposing
        ( Mapping
        , singleton
        , empty
        , insert
        , remove
        , get )

{-| This is part of the standard library for Delm.

@docs Mapping

@docs singleton

@docs empty

@docs insert

@docs remove

@docs get

-}

import Dict exposing (Dict)

{-| Mapping type.

-}
type Mapping comparable value
    = Mapping (Dict comparable value) value

{-| Creates a mapping with a single key-value pair.

-}
singleton : comparable -> value -> value -> Mapping comparable value
singleton comparable value _ =
    let
        internalDict =
            Dict.singleton comparable value
    in
    Mapping internalDict value


{-| Creates an empty mapping.

-}
empty : value -> Mapping comparable value
empty default =
    let
        dict =
            Dict.empty
    in
    Mapping dict default


{-| Inserts a key-value pair into a mapping.

-}
insert : comparable -> value -> Mapping comparable value -> Mapping comparable value
insert comparable value mapping =
    let
        ( dict, default ) =
            case mapping of
                Mapping d v ->
                    ( d, v )

        internalDict =
            Dict.insert comparable value dict
    in
    Mapping internalDict default


{-| Removes a key-value pair from a mapping.

-}
remove : comparable -> Mapping comparable value -> Mapping comparable value
remove comparable mapping =
    let
        ( dict, default ) =
            case mapping of
                Mapping d v ->
                    ( d, v )

        internalDict =
            Dict.remove comparable dict
    in
    Mapping internalDict default


{-| Gets a value from a mapping.

-}
get : comparable -> Mapping comparable value -> value
get comparable mapping =
    let
        ( dict, default ) =
            case mapping of
                Mapping d v ->
                    ( d, v )

        value =
            Dict.get comparable dict
    in
    case value of
        Just v ->
            v

        Nothing ->
            default
