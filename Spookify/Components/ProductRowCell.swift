//
//  ProductRowCell.swift
//  Spookify
//
//  Created by Sylus Abel on 05/06/2026.
//

import SwiftUI

struct ProductRowCell: View {
    var title: String = "Some Title"
    var subtitle: String = "Somesubtitle"
    var imageName: String = Constants.randomImage
    var imageSize: CGFloat = 60
    
    var onTapEllipsis: (() -> Void) = { }
    var onTapRow: (() -> Void) = { }
    
    var body: some View {
        HStack {
            ImageLoaderView(urlString: imageName)
                .frame(width: imageSize, height: imageSize)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(AppFonts.body())
                        .fontWeight(.medium)
                        .foregroundStyle(.appSecondary)
                        .lineLimit(1)
                    
                    Text(subtitle)
                        .font(AppFonts.caption(14))
                        .foregroundStyle(.appGray)
                        .lineLimit(2)
                }
                Spacer()
                Image(systemName: "ellipsis")
                    .foregroundStyle(.appSecondary)
                    .padding(16)
                    .background(.black.opacity(0.001))
                    .onTapGesture {
                        onTapEllipsis()
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .onTapGesture {
            onTapRow()
        }
    }
}

#Preview {
    ZStack {
        Color.appPrimary.ignoresSafeArea()
        
        VStack {
            ProductRowCell()
            ProductRowCell()
            ProductRowCell()
        }
        .padding()

    }
}
