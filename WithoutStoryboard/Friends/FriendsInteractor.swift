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
final class Interactor: FriendsInteractor  {
    
    private var networkServiceProtocol: NetworkServiceProtocol?
    private var fileCacheProtocol: FileCacheProtocol?
    private var friendsPresentationLogic: FriendsPresentationLogic?
    private var models: [DataFriend] = []
    
    
    init(presenter: FriendsPresentationLogic?, fileCacheProtocol: FileCacheProtocol?, networkServiceProtocol: NetworkServiceProtocol?) {
        self.friendsPresentationLogic = presenter
        self.fileCacheProtocol = fileCacheProtocol
        self.networkServiceProtocol = networkServiceProtocol
    }
    
    func startLoad() {
        models = fileCacheProtocol?.fetchFriends() ?? []
        friendsPresentationLogic?.presentFriendsData(data: models) // Отображаем данные из файл кэша, пока не получили новые от нетворк сервиса
        networkServiceProtocol?.getFriends {[weak self] result in
            switch result {
            case .success(let data):
                self?.fileCacheProtocol?.addFriends(friends: data) //Сохранили новые данные при успешном их получении
                self?.fileCacheProtocol?.addFriendDate() //Сохранили последнюю дату успешной загрузки
                self?.friendsPresentationLogic?.presentFriendsData(data: data)
            case .failure(let error):
                self?.models = self?.fileCacheProtocol?.fetchFriends() ?? [] //Берем последние актуальные данные
                let date =  self?.fileCacheProtocol?.fetchFriendDate()
                //         let date = DateHelper.getDate(date: fileCacheProtocol?.fetchFriendDate()) //Берем последнюю дату успешной загрузки
                self?.friendsPresentationLogic?.presentErrorData(error: error, date:  date ?? Date())
            }
        }
    }
}

