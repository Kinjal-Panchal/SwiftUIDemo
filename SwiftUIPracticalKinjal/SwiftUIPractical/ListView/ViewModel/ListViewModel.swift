//
//  ListViewModel.swift
//  KinjalPracticalSwiftUI
//
//  Created by Kinjal panchal on 10/02/23.
//

import Foundation

class ProductListViewModel: ObservableObject {
    
    @Published var productList = [Product]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchProductList()
    }
    
    func fetchProductList() {
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: UrlConstants.productListUrl)
        service.fetchProductList(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let products):
                    guard let objproduct = products.products else { return }
                    self.productList = objproduct
                }
            }
        }
    }
    
    
    //MARK: preview helpers
    
    static func errorState() -> ProductListViewModel {
        let fetcher = ProductListViewModel()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> ProductListViewModel {
        let fetcher = ProductListViewModel()
        fetcher.productList = [Product.getProduct(),Product.getProduct()]

        return fetcher
    }
}
