//
//  ProductrowView.swift
//  SwiftUIPractical
//
//  Created by Kinjal panchal on 11/02/23.
//

import SwiftUI

struct ProductRowView: View {
    
    let viewModel: Product
    
    var body: some View {
        HStack(spacing: 20) {
            if viewModel.imageURL != "" {
                ImageProductView(urlString: viewModel.imageURL ?? "", imageSize: CGSize(width: 80, height: 80), radius: 10)
            }
//            FavoriteButton(isFavorite: viewModel.isFavorite ?? false) {
//                viewModel.isFavorite?.toggle()
//                DataManager.shared.setFavoriteStatus(productTitle: viewModel.title ?? "", status: viewModel.isFavorite ?? false)
//            }
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.title ?? "").font(.system(size: 12, weight: .bold))
                Text("\(viewModel.price?.first?.value ?? 0.0)").font(.system(size: 10, weight: .bold))
            }
            
           }
        }
    }


struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(viewModel: Product.getProduct())
    }
}
