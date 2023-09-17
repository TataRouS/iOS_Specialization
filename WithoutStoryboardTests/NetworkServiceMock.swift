//
//  NetworkServiceSpy.swift
//  WithoutStoryboardTests
//
//  Created by Nata Kuznetsova on 16.09.2023.
//

@testable import WithoutStoryboard

enum MyError: Error {
    case customError
}

final class NetworkServiceMock: NetworkServiceProtocol {
    
    var  testData: [DataFriend] = []
    var  isSuccess = false
    
    
    func getFriends(completion: @escaping (Result<[DataFriend], Error>) -> Void) -> Void {
        if(isSuccess){
            completion(.success(testData))
        }
        else {
            completion(.failure(MyError.customError))
        }
    }
}

