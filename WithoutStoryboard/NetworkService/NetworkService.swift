//
//  NetworkService.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 12.08.2023.
//

import Foundation

//protocol NetworkServiceDelegate: AnyObject {
////    func updateTable (models: GroupsModel)
////}

final class NetworkService {
    
    private let session = URLSession.shared
    
    static var token = ""
    static var userID = ""
    
    func getFriends(completion: @escaping ([DataFriend]) -> Void ) {
        let url = URL(string: "https://api.vk.com/method/friends.get?fields=nickname,online,photo_50&access_token=\(NetworkService.token)&v=5.131")
        
        
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
                completion(friendsList.response.items)
                print(friendsList)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    
    func getGroups(completion: @escaping(GroupsModel) -> Void) {
        let url = URL(string: "https://api.vk.com/method/groups.get?fields=description&extended=1&access_token=\(NetworkService.token)&v=5.131")
        
        
        guard let url else {
            return
        }
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data else {
                return
            }
            do {
                let groups = try
                JSONDecoder().decode(GroupsModel.self, from: data)
                print(groups)
                completion(groups)
                //print(groups)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getPhotos(completion: @escaping ([DataPhotos]) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/photos.get?fields=bdate&access_token=\(NetworkService.token)&v=5.131&album_id=profile")
        else {
            return
        }
        
        session.dataTask(with: url) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                let imageURL = try
                JSONDecoder().decode(PhotosModel.self, from: data)
                completion(imageURL.response.items)
                    print(imageURL)
                } catch {
                print(error)
            }
        }.resume()
    }
    
    func getProfileInfo(completion: @escaping (ProfileModel) -> Void) {
        guard let url = URL(string: "https://api.vk.com/method/account.getProfileInfo?access_token=\(NetworkService.token)&v=5.131")
        else {
            return
        }

        session.dataTask(with: url) { (data, _, error) in
            guard let data else {
                return
            }
            do {
                let profile = try
                JSONDecoder().decode(ProfileModel.self, from: data)
                completion(profile)
                    print(profile)
                } catch {
                print(error)
            }
        }.resume()
    }
}

