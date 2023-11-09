//
//  Constant.swift
//  PokemonAssign15
//
//  Created by Rahul Adepu on 11/8/23.
//

import Foundation

struct Constant {
    static let pokemonListEndpoint = "https://api.pokemontcg.io/v2/cards?page=1&pageSize=15"
    static let previewPokemon: [PokemonData] = [PokemonData(
        id: "hgss4-1",
        name: "Aggron",
        supertype: "Pokemon",
        subtypes: ["Stage 2"], hp: "140",
        types: ["Metal"],
        evolvesFrom: "Lairon",
        attacks: [Attack.init(name: "Second Strike",
                              cost: ["metal", "colorless"],
                              convertedEnergyCost: 3,
                              damage: "40",
                              text: "If the Defending Pokémon already has any damage counters on it, this attack does 40 damage plus 40 more damage.")],
        weaknesses: [Resistance.init(type: "Psychic", value: "-20")],
        resistances: [Resistance.init(type: "Psychic", value: "-20")],
        retreatCost: ["colorless"],
        convertedRetreatCost: 4,
        datumSet: Set.init(id: "hgss4",
                          name: "HS—Triumphant",
                          series: "HeartGold & SoulSilver",
                          printedTotal: 102,
                          total: 103,
                          legalities: Legalities.init(unlimited: "legal", expanded: nil),
                          ptcgoCode: "TM",
                          releaseDate: "2010/11/03",
                          updatedAt: "2018/03/04 10:35:00",
                          images: SetImages.init(symbol: "https://images.pokemontcg.io/hgss4/symbol.png",
                                                 logo: "https://images.pokemontcg.io/hgss4/logo.png")),
        number: "1",
        artist: "Kagemaru Himeno",
        rarity: "Rare Holo",
        flavorText: "You can tell its age by the length of its iron horns. It claims an entire mountain as its territory.", 
        nationalPokedexNumbers: [306],
        legalities: Legalities.init(unlimited: "legal", expanded: nil),
        images: DatumImages.init(small: "https://images.pokemontcg.io/hgss4/1.png",
                                 large: "https://images.pokemontcg.io/hgss4/1_hires.png"),
        tcgplayer: Tcgplayer.init(url: "https://prices.pokemontcg.io/tcgplayer/hgss4-1",
                                  updatedAt: "2023/11/08",
                                  prices: Prices.init(holofoil: Holofoil.init(low: 1.33,
                                                                              mid: 1.78,
                                                                              high: 5.67,
                                                                              market: 1.61,
                                                                              directLow: nil),
                                                      reverseHolofoil: Holofoil.init(low: 1.99,
                                                                                     mid: 2.99,
                                                                                     high: 5.99,
                                                                                     market: 4.8,
                                                                                     directLow: 2.39),
                                                      normal: nil)),
        cardmarket: Cardmarket.init(url: "https://prices.pokemontcg.io/cardmarket/hgss4-1",
                                    updatedAt: "2023/11/08",
                                    prices: ["averageSellPrice":7.8]),
        evolvesTo: nil,
        level: nil,
        abilities: nil,
        rules: nil
    )]
}
