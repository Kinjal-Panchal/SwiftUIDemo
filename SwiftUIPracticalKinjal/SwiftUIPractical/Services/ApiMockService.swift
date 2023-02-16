//
//  ApiMockService.swift
//  SwiftUIPractical
//
//  Created by Kinjal panchal on 15/02/23.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var result: Result<RootProduct, APIError>
    
    func fetchProductList(url: URL?, completion: @escaping (Result<RootProduct, APIError>) -> Void) {
        completion(result)
    }
    
}
