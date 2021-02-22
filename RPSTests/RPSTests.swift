//
//  RPSTests.swift
//  RPSTests
//
//  Created by Admin on 22.02.2021.
//

import XCTest
@testable import RPS

class RPSTests: XCTestCase {

    func testRockResult() {
        let sign = Sign.rock
        XCTAssert(sign.getResult(for: .paper) == .lose)
        XCTAssert(sign.getResult(for: .rock) == .draw)
        XCTAssert(sign.getResult(for: .scissors) == .win)
    }
    
    func testPaperResult() {
        let sign = Sign.paper
        XCTAssert(sign.getResult(for: .paper) == .draw)
        XCTAssert(sign.getResult(for: .rock) == .win)
        XCTAssert(sign.getResult(for: .scissors) == .lose)
    }
    
    func testScissorsResult() {
        let sign = Sign.scissors
        XCTAssert(sign.getResult(for: .paper) == .win)
        XCTAssert(sign.getResult(for: .rock) == .lose)
        XCTAssert(sign.getResult(for: .scissors) == .draw)
    }

}
