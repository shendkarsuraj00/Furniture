//
//  ProductView.swift
//  Furniture
//
//  Created by Macbook on 26/02/25.
//

import SwiftUI

struct ProductCardView: View {
    
    @EnvironmentObject var cartManger: CartManager
    var product: Product
    
    var body: some View {
        ZStack {
            Color(.kSecondary)
            
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading) {
                    Image(product.image)
                        .resizable()
                        .frame(width: 175, height: 160)
                        .clipShape(.rect(cornerRadius: 12))
                    
                    Text(product.name)
                        .font(.headline)
                        .padding(.leading, 1)
                    
                    Text(product.supplier)
                        .foregroundStyle(.gray)
                        .font(.caption)
                        .padding(.vertical, 0.5)
                    
                    Text("\u{20B9} \(product.price)")
                        .bold()
                        
                }
                
                Button {
                    cartManger.addToCart(product: product)
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundStyle(.kPrimary)
                        .frame(width: 35, height: 35)
                        .padding(.trailing)
                }

            }
        }
        .frame(width: 185, height: 260)
        .clipShape(.rect(cornerRadius: 15))
    }
}

#Preview {
    ProductCardView(product: MockData.products[0])
        .environmentObject(CartManager())
}
