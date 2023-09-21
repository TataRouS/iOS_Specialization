//
//  FileCaheSpy.swift
//  WithoutStoryboardTests
//
//  Created by Nata Kuznetsova on 16.09.2023.
//

import Foundation
import CoreData
@testable import WithoutStoryboard

final class FileCacheSpy: FileCacheProtocol {
 
    
    // func delete(object: NSManagedObject)
    //    func addGroups(groups: [DataGroups])
    //    func fetchGroups() -> [DataGroups]
    //    func addGroupDate()
    //   func fetchGroupDate() -> Date?
    
    private(set) var isSaveWasCalled = false
    private(set) var isAddFriendsWasCalled = false
    private(set) var isFetchFriendsWasCalled = false
    private(set) var isAddFriendDateWasCalled = false
    private(set) var isFetchFriendDateWasCalled = false
    
    func save() {
        isSaveWasCalled = true
    }
    
    func addFriends (friends: [DataFriend]){
        isAddFriendsWasCalled = true
    }
    
    func fetchFriends() -> [DataFriend]{
        isFetchFriendsWasCalled = true
        return []
    }
    
    func addFriendDate(){
        isAddFriendDateWasCalled = true
    }
    
    func fetchFriendDate() -> Date?{
        isFetchFriendDateWasCalled = true
        return Date()
    }
    
    func delete(object: NSManagedObject) {
    }
    
    func addGroups(groups: [WithoutStoryboard.DataGroups]) {
      
    }
    
    func fetchGroups() -> [WithoutStoryboard.DataGroups] {
        return []
    }
    
    func addGroupDate() {
    
    }
    
    func fetchGroupDate() -> Date? {
        return Date()
    }
    
}
