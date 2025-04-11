//
//  Home.swift
//  SnacksApp
//
//  Created by Michelle Pichau on 08/04/25.
//

import SwiftUI

struct Home: View {
    // Category View Properties
    @State var selectedCategory = "choco"
    
    @EnvironmentObject var cartManager: CartManager // <- sem parênteses

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    //Header
                    HStack {
                        Text("Order From The Best OF **Snacks**")
                            .font(.system(size: 30))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Image(systemName: "line.3.horizontal")
                            .imageScale(.large)
                            .padding()
                            .frame(width: 70, height: 90)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                    }
                    .padding(28)
                    
                    // Category List
                    CategoryListView
                    
                    HStack {
                        Text("Choco **Collections**")
                            .font(.system(size: 24))
                        
                        Spacer()
                        
                        NavigationLink{
                            CollectionView()
                                .environmentObject(cartManager)
                        } label: {
                            Image(systemName: "arrow.right")
                                .imageScale(.large)
                        }
    
                        
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    
                    // Product List
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            ForEach(productList, id: \.id) { item in
                                ProductCard(product: item)
                                    .environmentObject(cartManager)
                            }
                        }
                        .padding(.leading)
                    }
                }
            }
        }
    }
    // Category List View
    var CategoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryList, id: \.id) { item in
                        Button {
                            selectedCategory = item.title
                        } label: {
                            HStack {
                                if item.title != "All" {
                                    Image(item.icon)
                                        .foregroundColor(selectedCategory == item.title ? .yellow : .black)
                                }
                                Text(item.title)
                            }
                            .padding(20)
                            .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                            .foregroundColor(selectedCategory != item.title ? .black : .white)
                            .clipShape(Capsule())
                        }
                    }
                }
            }
            .padding(.leading, 20)
        }
    }
}

#Preview {
    Home()
        .environmentObject(CartManager())
}

// Product Card View
struct ProductCard: View {
    
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            NavigationLink(destination: ProductDetailView(product: product)) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing, -200)
                    .rotationEffect(Angle(degrees: 30))
            }
            
            ZStack {
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font(.system(size:36, weight: .semibold))
                        .frame(width: 140)
                    
                    Text(product.category)
                        .font(.callout)
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack{
                        Text("$\(product.price).0")
                            .font(.system(size: 26, weight: .semibold))
                        
                        Spacer()
                        
                        Button{
                            cartManager.addToCart(product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.large)
                                .frame(width:98, height: 68)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, -100)
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                    
                })
                
            }
            .padding(30)
            .frame(width: 336, height: 422)
        }
        .frame(width: 336, height: 422)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 57))
        .padding(.leading, 14)
    }
}
