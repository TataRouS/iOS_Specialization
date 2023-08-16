//
//  FriendsModel.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 13.08.2023.
//

import Foundation

struct FriendsModel: Decodable {

        var response: Friends
        
    }
   
    struct DataFriend: Decodable {
        var nickname: String?
        var avatar: String
        
        
        enum CodingKeys: String, CodingKey {
            case nickname
            case avatar = "photo_50"
        }
    }

struct Friends: Decodable {
    var items: [DataFriend]
}


