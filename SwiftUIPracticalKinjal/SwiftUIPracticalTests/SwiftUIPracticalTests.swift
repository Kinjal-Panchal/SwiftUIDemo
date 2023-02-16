//
//  SwiftUIPracticalTests.swift
//  SwiftUIPracticalTests
//
//  Created by Kinjal panchal on 11/02/23.
//

import XCTest
import Combine
@testable import SwiftUIPractical

class ListTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    func test_getting_Products_success() {
        let result = Result<RootProduct, APIError>.success(RootProduct.getObjproducts())
        
        let fetcher = ProductListViewModel(service: APIMockService(result: result))
        
        let promise = expectation(description: "get ProductList")
        
        fetcher.$productList.sink { products in
            if products.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        
        wait(for: [promise], timeout: 2)
    }
    
    
    func test_loading_error() {
        
        let result = Result<RootProduct, APIError>.success(RootProduct.getObjproducts())
        
        let fetcher = ProductListViewModel(service: APIMockService(result: result))
        
        let promise = expectation(description: "show error message")
        fetcher.$productList.sink { products in
            if !products.isEmpty {
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        
        fetcher.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
        
    }
    
}
