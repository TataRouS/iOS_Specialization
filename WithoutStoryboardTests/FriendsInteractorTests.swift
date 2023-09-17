//
//  FriendsInteractorTests.swift
//  WithoutStoryboardTests
//
//  Created by Nata Kuznetsova on 15.09.2023.
//

import XCTest
@testable import WithoutStoryboard

final class FriendsInteractorTests: XCTestCase {
    
    private var interactor: Interactor!
    private var fileCacheProtocol: FileCacheSpy!
    private var networkServiceProtocol: NetworkServiceSpy!
    private var presenter: PresenterSpy!
    
    
    override func setUp()  {
        super.setUp()
        presenter = PresenterSpy()
        fileCacheProtocol = FileCacheSpy()
        networkServiceProtocol = NetworkServiceMock()
        interactor = Interactor(presenter: presenter, fileCacheProtocol: fileCacheProtocol, networkServiceProtocol: networkServiceProtocol))
    }
    
    
    override func tearDown() {
        interactor = nil
        presenter = nil
        fileCacheProtocol = nil
        networkServiceProtocol = nil
        super.tearDown()
    }
    
    func testGetFriendsSuccessStartLoadCalls(){
        presenter = PresenterSpy()
        fileCacheProtocol = FileCacheSpy()
        networkServiceProtocol = NetworkServiceMock(testData: [], isSuccess: true)
        interactor = Interactor(presenter: presenter, fileCacheProtocol: fileCacheProtocol, networkServiceProtocol: networkServiceProtocol))
        
        
        interactor.startLoad()
        
        XCTAssertTrue(FileCacheSpy.isAddFriendsWasCalled, "Метод AddFriendsFileCahe не вызван")
        XCTAssertTrue(FileCacheSpy.isAddFriendDateWasCalled, "Метод AddFriendDateFileCahe не вызван")
        XCTAssertTrue(presenter.isPresentFriendsDataWasCalled, "Метод PresentFriendsData не вызван")
    }
    
    
    func testGetFriendsFailureStartLoadCalls(){
        presenter = PresenterSpy()
        fileCacheProtocol = FileCacheSpy()
        networkServiceProtocol = NetworkServiceMock(testData: [], isSuccess: false)
        interactor = Interactor(presenter: presenter, fileCacheProtocol: fileCacheProtocol, networkServiceProtocol: networkServiceProtocol))
        
        interactor.startLoad()
        XCTAssertTrue(FileCacheSpy.isFetchFriendsWasCalled, "Метод FetchFriendsFileCahe не вызван")
        XCTAssertTrue(FileCacheSpy.isFetchFriendDateWasCalled, "Метод FetchFriendDateFileCahe не вызван")
        XCTAssertTrue(presenter.isPresentErrorDataWasCalled, "Метод PresentErrorData не вызван" )
    }
    
}
