//
//  ApiServiceProtocol.swift
//  SwiftUIPractical
//
//  Created by Kinjal panchal on 15/02/23.
//

import Foundation

protocol APIServiceProtocol {
    func fetchProductList(url: URL?, completion: @escaping(Result<RootProduct, APIError>) -> Void)
}
