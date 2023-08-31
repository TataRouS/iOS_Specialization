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
    var firstName: String?
    var lastName: String?
    var online: Int?
    var avatar: String
    var id: Int
    
    
    enum CodingKeys: String, CodingKey {
        case nickname
        case firstName = "first_name"
        case lastName = "last_name"
        case online
        case avatar = "photo_50"
        case id
    }
}

struct Friends: Decodable {
    var items: [DataFriend]
}


