//
//  FriendsPresenter.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 02.09.2023.
//

import Foundation

protocol FriendsPresentationLogic {
    func presentFriendsData(data: [DataFriend])
    func presentErrorData(error: Error, date: Date)
}

class FriendsPresenter: FriendsPresentationLogic {
    
    //MARK: - External vars
    var viewController: FriendsViewControllerProtocol
    
    //MARK: - Presentation logic
    init(viewController: FriendsViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func presentFriendsData(data: [DataFriend]){
        viewController.updateView(friendsList: data)
    }
    
    func presentErrorData(error: Error, date: Date ){
        viewController.showError(error: error, date: date)
    }
}



