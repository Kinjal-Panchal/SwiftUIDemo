//
//  DetailProductViewModel.swift
//  ProductListSwiftUI
//
//  Created by Виталий Шаповалов on 02.01.2022.
//

import Foundation

protocol DetailProductViewModelProtocol {
    var id : String { get }
    var imageData: Data? { get }
    var name: String { get }
    var rating: String { get }
    var price: String { get }
    var isFavorite: Bool { get }
    init(product: Product)
    func didTapFavoriteButton()
}

class DetailProductViewModel: DetailProductViewModelProtocol, ObservableObject {

    private let product: Product

    var id: String {
        "id : \(product.id ?? "")"
    }
    var imageData: Data? {
        try? Data(contentsOf: URL(string: product.imageURL ?? "")!)
    }

    var name: String {
        "Name: \(product.title ?? "")"
    }

    var rating: String {
        "Rating: \(product.ratingCount ?? 0.0)"
    }

    var price: String {
        "Price: $\(product.price?.first?.value ?? 0.0)"
    }

    @Published var isFavorite: Bool {
        didSet {
            DataManager.shared.setFavoriteStatus(productTitle: product.title ?? "", status: isFavorite)
        }
    }

    func didTapFavoriteButton() {
        isFavorite.toggle()
    }

    required init(product: Product) {
        self.product = product
        isFavorite = DataManager.shared.getFavoriteStatus(productTitle: product.title ?? "")
    }
}
