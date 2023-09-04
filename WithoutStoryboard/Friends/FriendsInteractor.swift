//
//  FriendInteractor.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 02.09.2023.
//

import Foundation

protocol FriendsInteractor {
    func startLoad()
}
class Interactor: FriendsInteractor  {
    
    var presenter: FriendsPresentationLogic?
    
    init(presenter: FriendsPresentationLogic? = nil) {
        self.presenter = presenter
    }
}

extension Interactor: FriendsInteractor {
    
    func fetchFriends() {
        //STUB: Fetch friends
    }
}
