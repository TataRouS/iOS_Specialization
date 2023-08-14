//
//  NetworkService.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 12.08.2023.
//

import Foundation

final class NetworkService {
    
    private let session = URLSession.shared
    
    static var token = ""
    static var userID = ""
    
    func getFriends() {
        let url = URL(string: "https://api.vk.com/method/friends.get?fields=nickname,photo_50&access_token=\(NetworkService.token)&v=5.131")
        
        guard let url else {
            return
        }
        print("MY____Token" + (NetworkService.token))
        session.dataTask(with: url) { (data, response,error) in
            guard let data else {
                return
            }
            do {
                let friendsList = try
                JSONDecoder().decode(FriendsModel.self, from: data)
                print(friendsList)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
    func getGroups() {
        let url = URL(string: "https://api.vk.com/method/groups.get?fields=description&extended=1&access_token=\(NetworkService.token)&v=5.131")
        
        
        guard let url else {
            return
        }
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data else {
                return
            }
            do {
                let extended = try
                JSONDecoder().decode(GroupsModel.self, from: data)
                print(extended)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getPhotos() {
        let url = URL(string: "https://api.vk.com/method/photos.get?fields=bdate&access_token=\(NetworkService.token)&v=5.131&album_id=profile")
        
        
        guard let url else {
            return
        }
        
        session.dataTask(with: url) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                let count = try
                JSONDecoder().decode(PhotosModel.self, from: data)
                print(count)
            } catch {
                print(error)
            }
        }.resume()
    }
}
