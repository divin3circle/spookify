//
//  ItemCell.swift
//  Spookify
//
//  Created by Sylus Abel on 28/05/2026.
//

import SwiftUI

struct ItemCell: View {
    var imageName: String = Constants.randomImage
    var title: String = "Title very loong it will overlapp by force"
    var imageSize: CGFloat = 160
    
    var body: some View {
        VStack {
            ImageLoaderView(urlString: imageName)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: imageSize, height: imageSize)
            
            Text(title)
                .font(AppFonts.body(16))
                .foregroundStyle(.appLight)
                .padding(4)
                .lineLimit(2)
            
        }
        .frame(width: imageSize)
    }
}

#Preview {
    ZStack {
        Color.appPrimary.ignoresSafeArea()
        
        ItemCell()
    }
}
