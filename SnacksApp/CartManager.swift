//
//  CartManager.swift
//  SnacksApp
//
//  Created by Michelle Pichau on 09/04/25.
//

import SwiftUI

struct CartItem {
    var product: Product
    var stock: Int = 20 // valor padrão
}


class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0

    func addToCart(_ product: Product) {
        products.append(product)
        total += product.price
    }

    func removeFromCart(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id }) {
            products.remove(at: index)
            total -= product.price
        }
    }

}
