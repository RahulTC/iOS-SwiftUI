//
//  PokemonData.swift
//  Assignment13App
//
//  Created by Rahul Adepu on 11/7/23.
//

import Foundation

struct PokemonData {
    static var pokemonListGen1:[PokemonModel] = [
        PokemonModel(name: "Bulbasaur", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F001.png&w=640&q=75"),
        PokemonModel(name: "Ivysaur", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F002.png&w=640&q=75"),
        PokemonModel(name: "Venusaur", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F003.png&w=640&q=75"),
        PokemonModel(name: "Charmander", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F004.png&w=640&q=75"),
        PokemonModel(name: "Charmeleon", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F005.png&w=640&q=75"),
        PokemonModel(name: "Charizad", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F006.png&w=640&q=75"),
        PokemonModel(name: "Squirtle", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F007.png&w=640&q=75"),
        PokemonModel(name: "Wartortle", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F008.png&w=640&q=75"),
        PokemonModel(name: "Blastoise", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F009.png&w=640&q=75")
    ]
    
    static var pokemonListGen2:[PokemonModel] = [
        PokemonModel(name: "Chikorita", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F152.png&w=640&q=75"),
        PokemonModel(name: "Bayleef", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F153.png&w=640&q=75"),
        PokemonModel(name: "Meganium", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F154.png&w=640&q=75"),
        PokemonModel(name: "Cyndaquil", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F155.png&w=640&q=75"),
        PokemonModel(name: "Quilava", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F156.png&w=640&q=75"),
        PokemonModel(name: "Typhlosion", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F157.png&w=640&q=75"),
        PokemonModel(name: "Totodile", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F158.png&w=640&q=75"),
        PokemonModel(name: "Croconaw", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F159.png&w=640&q=75"),
        PokemonModel(name: "Feraligator", img: "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F160.png&w=640&q=75")
    ]
    
    static var APIEndpoint = "https://db.pokemongohub.net/_next/image?url=%2Fimages%2Fofficial%2Ffull%2F152.png&w=640&q=75"
}
