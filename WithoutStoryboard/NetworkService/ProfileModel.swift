//
//  ProfileModel.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 21.08.2023.
//

import Foundation

struct ProfileModel: Decodable {
    
    var response: Profile
    
}

struct Profile: Decodable {
    var myFirstName: String?
    var myLastName: String?
    var myAvatar: String?
    
    
    enum CodingKeys: String, CodingKey {
        case myFirstName = "first_name"
        case myLastName = "last_name"
        case myAvatar = "photo_200"
    }
}



