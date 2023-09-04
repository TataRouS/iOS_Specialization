//
//  NetworkServiceTests.swift
//  WithoutStoryboardTests
//
//  Created by Nata Kuznetsova on 03.09.2023.
//

import XCTest
@testable import WithoutStoryboard

final class NetworkServiceTests: XCTestCase {
    
    private var NetworkService: NetworkService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        NetworkService = NetworkService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        NetworkService = nil
        super.tearDown()
    }

  func 

}
