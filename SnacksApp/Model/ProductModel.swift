//
//  ProductModel.swift
//  SnacksApp
//
//  Created by Michelle Pichau on 08/04/25.
//

import SwiftUI

// Product Model
struct Product: Identifiable {
    var id: UUID = .init()
    var name: String
    var category: String
    var description: String
    var image: String
    var color: Color
    var price: Int
    var stock: Int = 20 // valor padrão

}

// Sample Products
var productList = [
    Product(name: "Good Source", category: "Choco", description: "Good Source is the perfect snack for those who love the intense flavor of dark chocolate. Made with selected ingredients, it combines crunchiness and a striking flavor in every bite. Ideal for giving you that energy in the middle of the day or accompanying a special moment.", image: "image 1", color: .pink, price: 18),
    Product(name: "Unreal Muffins", category: "Choco", description: "Unreal Muffins – Dark Chocolate Peanut Butter Cups are the perfect combination of creamy and rich. A smooth peanut butter filling is wrapped in a generous layer of dark chocolate — the perfect balance of sweet and savory for a guilt-free snack." , image: "image 2", color: .yellow, price: 8),
    Product(name: "Twister Chips", category: "Chips",  description: "Twister Chips are spiral-shaped potato chips, super crunchy and full of flavor. Made with selected ingredients and a special touch of seasoning, they are the ideal snack for any time of day. An explosion of flavor in every bite!" , image: "image 3", color: .red, price: 25),
    Product(name: "Coconut Chips", category: "Chips",  description: "Coconut Chips are thin slices of coconut toasted to a perfect crunch. Light, naturally sweet and irresistible, they are the right choice for those who want a tropical snack that is healthy and full of flavor. One bite and you already feel like you are at the beach!" ,image: "image 4", color: .green, price: 22),
    Product(name: "Regular Nature", category: "Chips",  description: "Regular Nature is the ideal snack for those looking for simplicity with lots of flavor. Made with natural ingredients and just the right amount of crunch, it's perfect for accompanying your routine with lightness and balance. A classic that never disappoints." , image: "image 5", color: .blue, price: 9),
    Product(name: "Dark Russet", category: "Chips",  description: "Dark Russet brings the intensity and striking flavor that only rustic potatoes can offer. Powerful crunch, naturally darker color and a smoky flavor that wins you over from the first bite. A robust snack for those who enjoy personality!" , image: "image 6", color: .brown, price: 10),
    Product(name: "Smiths Chips", category: "Chips", description: "Smiths Chips are a classic that never goes out of style. Golden, crispy slices with the perfect seasoning to satisfy your hunger with lots of flavor. Perfect to share with friends. An iconic snack that always goes well with any occasion!" , image: "image 7", color: .orange, price: 80),
    Product(name: "Deep River", category: "Chips", description: "Deep River brings the intense crunch you love with a handmade touch and a striking flavor. Made with quality ingredients and a dash of attitude, it's the perfect snack for those who don't give up on high-quality flavor. One bite and you'll want to dig in!" , image: "image 8", color: .purple, price:47)
]
