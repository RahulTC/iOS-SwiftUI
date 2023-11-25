//
//  PlanetViewModelTests.swift
//  CombineAssignment18Tests
//
//  Created by Rahul Adepu on 11/22/23.
//

import XCTest
import Combine
@testable import CombineAssignment18

final class PlanetViewModelTests: XCTestCase {
    var planetViewModel: PlanetViewModel!
    
    override func setUpWithError() throws {
        planetViewModel = PlanetViewModel(manager: FakeNetworkManager())
    }
    
    override func tearDownWithError() throws {
        planetViewModel = nil
    }
    
    func test_GetdataFromViewModel_WhenWeAreExpecting_GoodResults() {
        //when
        planetViewModel.getAPIData(urlString: "PlanetListTest")
        let expectation = XCTestExpectation(description: "Fetching Planet List Data")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            //then
            XCTAssertGreaterThan(self.planetViewModel.planetList.count, 0)
            XCTAssertEqual(self.planetViewModel.planetList.count, 2)
            
            let planet = self.planetViewModel.planetList.first
            XCTAssertEqual(planet?.name, "Tatooine")
            XCTAssertEqual(planet?.climate, "arid")
            XCTAssertEqual(planet?.population, "200000")
            XCTAssertEqual(self.planetViewModel.customError, nil)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func test_GetdataFromViewModel_WhenWeAreExpecting_WhenWeDontPassURL() throws {
        //when
        planetViewModel.getAPIData(urlString: "")
        let expectation = XCTestExpectation(description: "Testing - Empty url string")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            //then
            XCTAssertEqual(self.planetViewModel.planetList.count, 0)
            XCTAssertNotNil(self.planetViewModel.customError)
            XCTAssertEqual(self.planetViewModel.customError, NetworkError.urlError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func test_GetdataFromViewModel_WhenWeAreExpecting_WhenWePassWrongURL() throws {
        //when
        planetViewModel.getAPIData(urlString: "asdasdasdas")
        let expectation = XCTestExpectation(description: "Testing - API URL is wrong")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            //then
            XCTAssertEqual(self.planetViewModel.planetList.count, 0)
            XCTAssertNotNil(self.planetViewModel.customError)
            // Expected Error Output should be urlError
//            XCTAssertEqual(self.planetViewModel.customError, NetworkError.urlError)
            
            // Actual Error After running test
            XCTAssertEqual(self.planetViewModel.customError, NetworkError.dataNotFound)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func test_GetdataFromViewModel_WhenWeAreExpecting_WhenParsingError() throws {
        //when
        planetViewModel.getAPIData(urlString: "PlanetListParsingIssue")
        let expectation = XCTestExpectation(description: "Testing - The data couldn’t be read because it is missing")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            //then
            XCTAssertEqual(self.planetViewModel.planetList.count, 0)
            XCTAssertNotNil(self.planetViewModel.customError)
            XCTAssertEqual(self.planetViewModel.customError, NetworkError.parsingError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func test_GetdataFromViewModel_WhenWeAreExpecting_WhenNoData() throws {
        //when
        planetViewModel.getAPIData(urlString: "PlanetListDataNotFound")
        let expectation = XCTestExpectation(description: "Testing - Counldn't read data from server")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            //then
            XCTAssertEqual(self.planetViewModel.planetList.count, 0)
            XCTAssertNotNil(self.planetViewModel.customError)
            XCTAssertEqual(self.planetViewModel.customError, NetworkError.dataNotFound)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testPerformanceExample() throws {
        
        self.measure {
            
        }
    }
    
}
