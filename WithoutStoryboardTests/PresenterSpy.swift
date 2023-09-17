//
//  PresenterSpy.swift
//  WithoutStoryboardTests
//
//  Created by Nata Kuznetsova on 15.09.2023.
//

@testable import WithoutStoryboard

final class PresenterSpy: FriendsPresentationLogic {
    private(set) var isPresentFriendsDataWasCalled = false
    private(set) var isPresentErrorDataWasCalled = false
    
    func presentFriendsData(data: [DataFriend]) {
        isPresentFriendsDataWasCalled = true
    }
    
    
    func presentErrorData(error: Error, date: Date){
        isPresentErrorDataWasCalled = true
    }
}
