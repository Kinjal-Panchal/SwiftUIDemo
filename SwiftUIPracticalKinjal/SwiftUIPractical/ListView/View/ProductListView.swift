//
//  ProductListView.swift
//  KinjalPracticalSwiftUI
//
//  Created by Kinjal panchal on 10/02/23.
//

import SwiftUI

struct ProductListView: View {
    
    let productlist: [Product]
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack{
                
                List(productlist, id: \.id) { product in
                    NavigationLink(destination: DetailProductView(product: product, detailProductVM: DetailProductViewModel(product: Product.getProduct()))) {
                        ProductRowView(viewModel: product)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("ProductList")
            }
        }
       }
    }


struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(productlist: ProductListViewModel.successState().productList)
    }
}
