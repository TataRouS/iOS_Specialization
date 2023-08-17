//
//  NetworkService.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 12.08.2023.
//

import Foundation

protocol NetworkServiceDelegate: AnyObject {
    func updateTable (models: GroupsModel)
}

final class NetworkService {
    
    private let session = URLSession.shared
    
    static var token = ""
    static var userID = ""
    
    func getFriends() {
        let url = URL(string: "https://api.vk.com/method/friends.get?fields=nickname,online,photo_50&access_token=\(NetworkService.token)&v=5.131")
        
      
//https://api.vk.com/method/friends.get?fields=nickname,online,photo_50&access_token=vk1.a.1_bsGrWkSRnJICQ5MwTstRAw8IfSGuDcCZ6MRXzXuqIh0dC1_mPInn4vZeNaLJsCfKQnoLZoWHpeYRaiYseExQL56BB3afyWiBbGdi7UAukaMb187FKrYrIpjudIdhyYQ6JYwSHOpXkWP-MKzga1ybPpJXkbblH0SZZzc7hiC1Pq5nuaeyFuwN6ki2wSTbG1QJBRfFAHW-0msHn-fA3x6A&v=5.131
//        vk1.a.1_bsGrWkSRnJICQ5MwTstRAw8IfSGuDcCZ6MRXzXuqIh0dC1_mPInn4vZeNaLJsCfKQnoLZoWHpeYRaiYseExQL56BB3afyWiBbGdi7UAukaMb187FKrYrIpjudIdhyYQ6JYwSHOpXkWP-MKzga1ybPpJXkbblH0SZZzc7hiC1Pq5nuaeyFuwN6ki2wSTbG1QJBRfFAHW-0msHn-fA3x6A
        
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
    
//    func getPhotos() {
//        let url = URL(string: "https://api.vk.com/method/photos.get?fields=bdate&access_token=\(NetworkService.token)&v=5.131&album_id=profile")
//        
//        
//        guard let url else {
//            return
//        }
//        
//        session.dataTask(with: url) { (data, _, error) in
//            guard let data else {
//                return
//            }
//            do {
//                let imageURL = try
//                JSONDecoder().decode(PhotosModel.self, from: data).url
//                guard let imageURL = URL(string: imageURL) else {
//                    return}
//                session.dataTask(with: imageURL) { (data, _, error) in
//                    guard let data, let image = UIImage(data: data) else {
//                        return
//                    }
//                    DispatchQueue.main.async { () -> Void in
//                        self.image = image
//                    }
//                }.resume()
//                } catch {
//                print(error)
//            }
//        }.resume()
//    }
}
