//
//  CollectionView.swift
//  SnacksApp
//
//  Created by Michelle Pichau on 09/04/25.
//

import SwiftUI

struct CollectionView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    @State var selectedCategory = "All"

    
    var body: some View {
        NavigationView{
            ScrollView {
                VStack {
                    //header
                    HStack {
                        Text("**Chips** Collection")
                            .font(.system(size: 38))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button{
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                        .foregroundStyle(.black)
                    }
                    .padding(30)
                    
                    // Category List
                    CategoryListView

                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],
                              content: {
                        ForEach(productList, id: \.id) { item in
                            SmallProductCard(product: item)
                                .environmentObject(cartManager)
                        }
                    })
                    .padding(.horizontal)
                }
            }
        }
    }
    // Category Products
    var CategoryListView: some View {
        NavigationLink(destination: CategoryProductsView().environmentObject(cartManager)) {
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
}

#Preview {
    CollectionView()
        .environmentObject(CartManager())
}


struct SmallProductCard: View {
    
    var product: Product
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            NavigationLink(destination: ProductDetailView(product: product)) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing, -140)
                    .rotationEffect(Angle(degrees: 30))
            }
            
            ZStack{
                VStack(alignment: .leading, content: {
                    Text("\(product.name)")
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: 70)
                    
                    Text(product.category)
                        .font(.system(size:10))
                        .padding()
                        .background(.white.opacity(0.5))
                        .clipShape(Capsule())
                    
                    Spacer()
                    
                    HStack {
                        Text("$\(product.price).0")
                            .font(.system(size: 14, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            cartManager.addToCart(product)

                        } label: {
                            Image (systemName: "basket")
                                .imageScale(.large)
                                .frame(width: 45, height: 40)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.trailing, -12)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 45)
                    .background(.white.opacity(0.9))
                    .clipShape(Capsule())
                    
                })
            }
            .padding(20)
            .frame(width: 170, height: 215)
        }
        .frame(width: 170, height: 215)
        .background(product.color.opacity(0.13))
        .clipShape(.rect(cornerRadius: 30))
        .padding(.top)
    }
}
