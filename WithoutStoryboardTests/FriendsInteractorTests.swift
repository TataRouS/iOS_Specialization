//
//  FriendsInteractorTests.swift
//  WithoutStoryboardTests
//
//  Created by Nata Kuznetsova on 15.09.2023.
//
import Foundation
import XCTest
@testable import WithoutStoryboard

final class FriendsInteractorTests: XCTestCase {
    
    private var interactor: Interactor!
    private var fileCacheProtocol: FileCacheSpy!
    private var networkServiceProtocol: NetworkServiceMock!
    private var presenter: PresenterSpy!
    
    
    override func setUp()  {
        super.setUp()
        presenter = PresenterSpy()
        fileCacheProtocol = FileCacheSpy()
        networkServiceProtocol = NetworkServiceMock()
        interactor = Interactor(presenter: presenter, fileCacheProtocol: fileCacheProtocol, networkServiceProtocol: networkServiceProtocol)
    }
    
    
    override func tearDown() {
        interactor = nil
        presenter = nil
        fileCacheProtocol = nil
        networkServiceProtocol = nil
        super.tearDown()
    }
    
    func testGetFriendsSuccessStartLoadCalls(){
        networkServiceProtocol.isSuccess = true
        interactor.startLoad()
        XCTAssertTrue(fileCacheProtocol.isAddFriendsWasCalled, "Метод AddFriendsFileCahe не вызван")
        XCTAssertTrue(fileCacheProtocol.isAddFriendDateWasCalled, "Метод AddFriendDateFileCahe не вызван")
        XCTAssertTrue(presenter.isPresentFriendsDataWasCalled, "Метод PresentFriendsData не вызван")
    }
    
    
    func testGetFriendsFailureStartLoadCalls(){
        networkServiceProtocol.isSuccess = false
        interactor.startLoad()
        XCTAssertTrue(fileCacheProtocol.isFetchFriendsWasCalled, "Метод FetchFriendsFileCahe не вызван")
        XCTAssertTrue(fileCacheProtocol.isFetchFriendDateWasCalled, "Метод FetchFriendDateFileCahe не вызван")
        XCTAssertTrue(presenter.isPresentErrorDataWasCalled, "Метод PresentErrorData не вызван" )
    }
    
}
