//
//  FriendsPresenter.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 02.09.2023.
//

import Foundation

protocol FriendsPresentationLogic {
    func presentFriendsData(data: [DataFriend])
        func presentErrorData(error: Error)
    }

class FriendsPresenter: FriendsPresentationLogic {
    
    //MARK: - External vars
    var viewController: FriendsViewControllerProtocol
    
    //MARK: - Presentation logic
    
}
    extension FriendsPresenter: FriendsPresentationLogic {
        func presentFriendsData(data: [DataFriend]){
            viewController.updateView(data)
        }
        
        func presentErrorData(error: Error){
            viewController.showError(error)
        }
    }


