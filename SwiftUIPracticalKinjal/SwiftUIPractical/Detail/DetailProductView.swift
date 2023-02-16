//
//  DetailProductView.swift
//  ProductListSwiftUI
//
//  Created by Виталий Шаповалов on 02.01.2022.
//

import SwiftUI

struct DetailProductView: View {
    
    var product: Product
    let imageSize: CGFloat = 300
    @ObservedObject var detailProductVM: DetailProductViewModel
   
    var body: some View {
        VStack(spacing: 30) {
            Text(product.title ?? "")
                .font(.largeTitle)
                .padding()
            GeometryReader { geometry in
                ImageProductView(urlString: product.imageURL ?? "", imageSize: CGSize(width: 300, height: 250), radius: 10)
               
                FavoriteButton(isFavorite: product.isFavorite ?? false) {
                    product.isFavorite?.toggle()
                    detailProductVM.didTapFavoriteButton()                  
                }
                .position(x: geometry.size.width - 20, y: geometry.size.height - 20)
            }
            .frame(width: 300, height: 250)
            VStack(alignment: .leading, spacing: 10) {
                Text(product.title ?? "")
                Text("\(product.ratingCount ?? 0.0)")
                Text("\(product.price?.first?.value ?? 0.0)")
            }
            .font(.headline)
            .padding()
            Spacer()
        }
    }
}

struct DetailProductView_Previews: PreviewProvider {
    static var previews: some View {
        DetailProductView(product: Product.getProduct(), detailProductVM: DetailProductViewModel(product: Product.getProduct()))
    }
}

