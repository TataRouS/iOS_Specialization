//
//  NetworkService.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 12.08.2023.
//

import Foundation

final class NetworkService {
    private let session = URLSession.shared
    
    func getData(){
        let url = URL(string: <#T##String#>)
        
        session.dataTask(with: url!){ (data, _, error) in
            guard let data = data else {
                return
            }
            do {
                let towns = try
                JSONDecoder().decode([].self, from: data)
                print(<#T##items: Any...##Any#>)
            } catch {
             print(error)
            }
        }.resume()
    }
}

