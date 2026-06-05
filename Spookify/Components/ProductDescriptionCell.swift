//
//  ProductDescriptionCell.swift
//  Spookify
//
//  Created by Sylus Abel on 05/06/2026.
//

import SwiftUI

struct ProductDescriptionCell: View {
    var productDescription: String = Product.getRandomProduct().description
    var username: String = "sylus"
    var subheasline: String = "Some Headeline"
    
    var onAddToCart: () -> Void = { }
    var onBookmark: () -> Void = { }
    var onShare: () -> Void = { }
    var onEllipsis: () -> Void = { }
    var onLike: () -> Void = { }
    var onDislike: () -> Void = { }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(productDescription)
                .font(AppFonts.body())
                .foregroundStyle(.appLight)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(3)
            
            HStack(spacing: 8) {
                Image(systemName: "applelogo")
                    .font(.title3)
                    .foregroundStyle(Color.green)
                
                madeForYouSection
                
            }
            .font(.callout)
            .fontWeight(.medium)
            .foregroundStyle(.appGray)
            
            buttonRow
        }
    }
    
    private var madeForYouSection: some View {
        Text("Made for ")
            .font(AppFonts.body())
        +
        Text(username)
            .font(AppFonts.body())
            .bold()
            .foregroundStyle(.appSecondary)
    }
    
    private var buttonRow: some View
    {
        HStack(spacing: 0) {
            Image(systemName: "plus.circle")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onAddToCart()
                }
            
            Image(systemName: "bookmark")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onAddToCart()
                }
            
            Image(systemName: "square.and.arrow.up")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onAddToCart()
                }
            
            Image(systemName: "ellipsis")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onAddToCart()
                }
            
            Spacer()
            
            Image(systemName: "hand.thumbsdown")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onAddToCart()
                }
            Image(systemName: "hand.thumbsup")
                .padding(8)
                .background(.black.opacity(0.001))
                .onTapGesture {
                    onAddToCart()
                }
        }
        .offset(x: -8)
    }
}

#Preview {
    ZStack {
        Color.appPrimary.ignoresSafeArea()
        
        ProductDescriptionCell()
            .padding()
    }
}
