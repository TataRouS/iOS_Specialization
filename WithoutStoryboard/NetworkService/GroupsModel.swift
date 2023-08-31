//
//  GroupsModel.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 13.08.2023.
//

import Foundation

struct GroupsModel: Decodable {
    
    var response: Groups
    
}

struct DataGroups: Decodable {
    var description: String?
    var name: String
    var id: Int
}

struct Groups: Decodable {
    var items: [DataGroups]
}
