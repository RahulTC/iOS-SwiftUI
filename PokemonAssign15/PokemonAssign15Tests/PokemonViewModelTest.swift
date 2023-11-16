//
//  PokemonViewModel.swift
//  PokemonAssign15Tests
//
//  Created by Rahul Adepu on 11/10/23.
//

import XCTest
@testable import PokemonAssign15

@MainActor
final class PokemonViewModelTest: XCTestCase {
    
    var pokemonViewModel: PokemonViewModel!

    override func setUpWithError() throws {
        pokemonViewModel = PokemonViewModel(manager: FakeNetworkManager())
    }

    override func tearDownWithError() throws {
        pokemonViewModel = nil
    }

    func test_GetdataFromViewModel_WhenWeAreExpecting_GoodResults() async throws {
        //when
        await pokemonViewModel.getAPIData(urlString: "PokemonList")
        
        //then
        XCTAssertGreaterThan(pokemonViewModel.pokemonList.count, 0)
        XCTAssertEqual(pokemonViewModel.pokemonList.count, 2)
        
        let pokemon = pokemonViewModel.pokemonList.first
        XCTAssertEqual(pokemon?.hp, "140")
        XCTAssertEqual(pokemon?.name, "Aggron")
        XCTAssertEqual(pokemon?.id, "hgss4-1")
        XCTAssertEqual(pokemonViewModel.customError, nil)
        
    }

    func test_GetdataFromViewModel_WhenWeAreExpecting_WhenWeDontPassURL() async throws {
        //when
        await pokemonViewModel.getAPIData(urlString: "")
        
        //then
        XCTAssertEqual(pokemonViewModel.pokemonList.count, 0)
        XCTAssertNotNil(pokemonViewModel.customError)
        XCTAssertEqual(pokemonViewModel.customError, NetworkError.urlError)
    }
    
    func test_GetdataFromViewModel_WhenWeAreExpecting_WhenWePassWrongURL() async throws {
        //when
        await pokemonViewModel.getAPIData(urlString: "asdasdasdas")
        
        //then
        XCTAssertEqual(pokemonViewModel.pokemonList.count, 0)
        XCTAssertNotNil(pokemonViewModel.customError)
        XCTAssertEqual(pokemonViewModel.customError, NetworkError.urlError)
    }
    
    func test_GetdataFromViewModel_WhenWeAreExpecting_WhenParsingError() async throws {
        //when
        await pokemonViewModel.getAPIData(urlString: "PokemonListParsingIssue")
        
        //then
        XCTAssertEqual(pokemonViewModel.pokemonList.count, 0)
        XCTAssertNotNil(pokemonViewModel.customError)
        XCTAssertEqual(pokemonViewModel.customError, NetworkError.parsingError)
    }
    
    func test_GetdataFromViewModel_WhenWeAreExpecting_WhenNoData() async throws {
        //when
        await pokemonViewModel.getAPIData(urlString: "PokemonListDataNotFound")
        
        //then
        XCTAssertEqual(pokemonViewModel.pokemonList.count, 0)
        XCTAssertNotNil(pokemonViewModel.customError)
        XCTAssertEqual(pokemonViewModel.customError, NetworkError.dataNotFound)
    }
    
}
