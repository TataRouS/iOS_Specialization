//
//  NetworkServiceProtocol.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 09.09.2023.
//

protocol NetworkServiceProtocol {
    func getFriends(completion: @escaping (Result<[DataFriend], Error>) -> Void) -> Void
}
