//
//  NetworkServiceSpy.swift
//  WithoutStoryboardTests
//
//  Created by Nata Kuznetsova on 16.09.2023.
//

@testable import WithoutStoryboard

final class NetworkServiceMock: NetworkServiceProtocol {
    
    var testData: DataFriend
    var isSuccess: boolean
    
    init(testData: [DataFriend], isSuccess: boolean) {
        self.testData = testData
        self.isSuccess = isSuccess
    }
    func getFriends(completion: @escaping (Result<[DataFriend], Error>) -> Void) -> Void {
        if(isSuccess){
            completion(.success(testData))
        }
        else {
            completion(.failure("error"))
        }
    }
}

