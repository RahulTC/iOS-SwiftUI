//
//  JMPCSchoolViewModelTest.swift
//  JMPCSchoolAppAssign17Tests
//
//  Created by Rahul Adepu on 11/15/23.
//

import XCTest
@testable import JMPCSchoolAppAssign17

@MainActor

final class JMPCSchoolViewModelTest: XCTestCase {
    
    var jmpcViewModel: JMPCSchoolViewModel!

    override func setUpWithError() throws {
        jmpcViewModel = JMPCSchoolViewModel(manager: FakeNetworkManager())
    }

    override func tearDownWithError() throws {
        jmpcViewModel = nil
    }

    func test_GetdataFromViewModel_WhenWeAreExpecting_GoodResults() async throws {
        //when
        await jmpcViewModel.getAPIData(urlString: "PokemonList", apiType: .schoolAPI)
        
        //then
        XCTAssertGreaterThan(jmpcViewModel.schoolList.count, 0)
        XCTAssertEqual(jmpcViewModel.schoolList.count, 2)
        
        let school = jmpcViewModel.schoolList.first
        XCTAssertEqual(school?.id, "140")
        XCTAssertEqual(school?.school_name, "Aggron")
        XCTAssertEqual(jmpcViewModel.customError, nil)
        
    }

    func test_GetdataFromViewModel_WhenWeAreExpecting_WhenWeDontPassURL() async throws {
        //when
        await jmpcViewModel.getAPIData(urlString: "", apiType: .schoolAPI)
        
        //then
        XCTAssertEqual(jmpcViewModel.schoolList.count, 0)
        XCTAssertNotNil(jmpcViewModel.customError)
        XCTAssertEqual(jmpcViewModel.customError, NetworkErrors.urlError)
    }
    
    func test_GetdataFromViewModel_WhenWeAreExpecting_WhenWePassWrongURL() async throws {
        //when
        await jmpcViewModel.getAPIData(urlString: "", apiType: .schoolAPI)
        
        //then
        XCTAssertEqual(jmpcViewModel.schoolList.count, 0)
        XCTAssertNotNil(jmpcViewModel.customError)
        XCTAssertEqual(jmpcViewModel.customError, NetworkErrors.urlError)
    }
    
    func test_GetdataFromViewModel_WhenWeAreExpecting_WhenParsingError() async throws {
        //when
        await jmpcViewModel.getAPIData(urlString: "", apiType: .schoolAPI)
        
        //then
        XCTAssertEqual(jmpcViewModel.schoolList.count, 0)
        XCTAssertNotNil(jmpcViewModel.customError)
        XCTAssertEqual(jmpcViewModel.customError, NetworkErrors.parsingError)
    }
    
    func test_GetdataFromViewModel_WhenWeAreExpecting_WhenNoData() async throws {
        //when
        await jmpcViewModel.getAPIData(urlString: "", apiType: .schoolAPI)
        
        //then
        XCTAssertEqual(jmpcViewModel.schoolList.count, 0)
        XCTAssertNotNil(jmpcViewModel.customError)
        XCTAssertEqual(jmpcViewModel.customError, NetworkErrors.dataNotFound)
    }

}
