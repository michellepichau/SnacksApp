//
//  CategoryModel.swift
//  SnacksApp
//
//  Created by Michelle Pichau on 08/04/25.
//

import SwiftUI

struct CategoryModel: Identifiable, Hashable {
    var id: UUID = .init()
    var icon: String
    var title: String
}

var categoryList: [CategoryModel] = [
    CategoryModel(icon: "", title: "All"),
    CategoryModel(icon: "choco", title: "Choco"),
    CategoryModel(icon: "wafles", title: "Wafles"),
    CategoryModel(icon: "toffee", title: "Toffee"),
]
