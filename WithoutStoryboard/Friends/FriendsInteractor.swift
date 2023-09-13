//
//  FriendInteractor.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 02.09.2023.
//

import Foundation
import UIKit

protocol FriendsInteractor {
    func startLoad()
}
class Interactor: FriendsInteractor  {
    
    private var presenter: FriendsPresentationLogic?
    private var networkServiceProtocol: NetworkServiceProtocol?
    private weak var fileCache: FileCache?
    private var friendsPresentationLogic: FriendsPresentationLogic?
    private var models: [DataFriend] = []
    
    init(presenter: FriendsPresentationLogic? = nil, friendsPresentationLogic: FriendsPresenter?, fileCache: FileCache?, networkServiceProtocol: NetworkServiceProtocol?) {
        self.friendsPresentationLogic = friendsPresentationLogic
        self.fileCache = fileCache
        self.networkServiceProtocol = networkServiceProtocol
    }
    
//    extension Interactor: FriendsInteractor {
        
        func startLoad() {
            networkServiceProtocol?.getFriends {[weak self] result in
                switch result {
                case .success(let data):
                    self?.friendsPresentationLogic?.presentFriendsData(data: data)
                case .failure(let error):
                    self?.friendsPresentationLogic?.presentErrorData(error: error)
                }
//            }
        }
    }
}
