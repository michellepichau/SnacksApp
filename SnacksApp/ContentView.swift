//
//  ContentView.swift
//  SnacksApp
//
//  Created by Michelle Pichau on 08/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Home()
                    .environmentObject(cartManager)
                
                if cartManager.products.count > 0 {
                    NavigationLink(destination: CartView().environmentObject(cartManager)) {
                        HStack(spacing: 30) {
                            Text("\(cartManager.products.count)")
                                .padding()
                                .background(.yellow)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("Cart")
                                    .font(.system(size: 26, weight: .semibold))
                                
                                Text("\(cartManager.products.count) Item")
                                    .font(.system(size: 18))
                            }
                            
                            Spacer()
                            
                            ForEach(cartManager.products, id: \.name) { product in
                                Image(product.image)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(8)
                                    .frame(width: 60, height: 60)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .padding(.leading, -60)
                            }
                        }
                        .padding(30)
                        .frame(maxWidth: .infinity, maxHeight: 120)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 60, style: .continuous))
                        .foregroundColor(.white)
                        .edgesIgnoringSafeArea(.bottom)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    ContentView()
}
