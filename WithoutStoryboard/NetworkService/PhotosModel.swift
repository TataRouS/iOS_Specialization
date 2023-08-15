//
//  PhotosModel.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 12.08.2023.
//

import Foundation


struct PhotosModel: Decodable {
    
    var response: Photos
    
}

struct DataPhotos: Decodable {
    var sizes: [Sizes]
}

struct Sizes: Decodable {
    var url: String
}

struct Photos: Decodable {
    var items: [DataPhotos]
}

