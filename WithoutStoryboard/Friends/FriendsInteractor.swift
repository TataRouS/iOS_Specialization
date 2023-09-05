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
    private let networkService = NetworkService()
    private var fileCache = FileCache()
    private let friendsPresenter = FriendsPresenter()
    private var models: [DataFriend] = []
    
    init(presenter: FriendsPresentationLogic? = nil) {
        self.presenter = presenter
    }
    
    networkService.getFriends(completion: (Result<[DataFriend], Error>) -> Void)
    
    extension Interactor: FriendsInteractor {
        
        func startLoad() {
            self.getFriends {[weak self] result in
                switch result {
                case .success(_): presenter.presentFriendsData
                    
                case .failure(_):
                    Interactor.showAlert2
                }
            }
            
            private  func getFriends(){
                networkService.getFriends {[weak self] result in
                    switch result {
                    case .success(let friendsList):
                        self?.models = friendsList
                        self?.fileCache.addFriends(friends: friendsList)
                        DispatchQueue.main.async {
                            self?.tableView.reloadData()
                        }
                    case .failure(_):
                        self?.models = self?.fileCache.fetchFriends() ?? []
                        DispatchQueue.main.async {
                            self?.showAlert()
                        }
                    }
                    
                }
            }
            
            extension Interactor: FriendsInteractor {
                func showAlert2(){
                    let date = DateHelper.getDate(date: fileCache.fetchFriendDate())
                    let alert = UIAlertController(title: "Не удалось получить данные",
                                                  message: "Данные актуальны на \(date)",
                                                  preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Закрыть", style: .default, handler: nil))
                    present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
