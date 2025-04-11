//
//  CategoryProductsView.swift
//  SnacksApp
//
//  Created by Michelle Pichau on 10/04/25.
//

import SwiftUI

struct CategoryProductsView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    @State var selectedCategory = "Choco"

    var body: some View {
        NavigationView{
            ScrollView {
                VStack {
                    HStack {
    
                        Text("**Choco**")
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
                    
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(productList.filter { $0.category == selectedCategory }, id: \.id) { item in
                            SmallProductCard(product: item)
                                .environmentObject(cartManager)
                        }
                    }
                    .padding(.horizontal)

                }
            }
        }
    }
    
    var CategoryListView: some View {
        HStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categoryList, id: \.id) { item in
                        Button {
                            selectedCategory = item.title
                        } label: {
                            HStack {
                                if item.title != "choco" {
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
    CategoryProductsView()
        .environmentObject(CartManager())

}
