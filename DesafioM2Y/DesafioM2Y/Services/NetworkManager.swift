//
//  Untitled.swift
//  DesafioM2Y
//
//  Created by Diego Janjardi Briz Llopis on 30/01/25.
//

import Alamofire
import RxSwift

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func request<T: Decodable>(_ url: String) -> Single<T> {
        return Single.create { single in
            let request = AF.request(url)
                .validate()
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let value):
                        single(.success(value))
                    case .failure(let error):
                        single(.failure(error))
                    }
            }
            return Disposables.create { request.cancel() }
        }
    }
}

