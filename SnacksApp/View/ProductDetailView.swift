//
//  ProductDetailView.swift
//  SnacksApp
//
//  Created by Michelle Pichau on 10/04/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    var product : Product
    
    @EnvironmentObject var cartManager: CartManager
    
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    HStack {
                        Text("\(product.name)")
                            .font(.system(size: 38))
                            .padding(.trailing)
                        
                        Spacer()
                        
                        Button {
                            mode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .imageScale(.large)
                                .padding()
                                .frame(width: 70, height: 90)
                                .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
                        }
                    }
                    .padding(30)
                    
                    VStack {
                        Image("\(product.image)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 280, height: 280)
                            .padding(.bottom, 28)
                    }
                    
                    HStack{
                        Text("Value: $\(product.price).0")
                            .font(.system(size: 24, weight: .semibold))
                        
                        Spacer()
                        
                        Button{
                            cartManager.addToCart(product)
                        } label: {
                            Image(systemName: "basket")
                                .imageScale(.medium)
                                .frame(width:94, height: 64)
                                .background(.black)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, -110)
                    }
                    .padding(.leading)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 76)
                    .clipShape(Capsule())
                    
                    VStack{
                        Text("About the product:")
                            .font(.system(size: 18, ))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(product.description)")
                            .font(.system(size: 18, weight: .light))
                    }
                    .padding(30)
                    
                }
            }
        }
        .navigationBarHidden(true)
    }
}


#Preview {
    ProductDetailView(product: productList[0])
        .environmentObject(CartManager())

}







