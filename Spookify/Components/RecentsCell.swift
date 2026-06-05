//
//  RecentsCell.swift
//  Spookify
//
//  Created by Sylus Abel on 27/05/2026.
//

import SwiftUI

struct RecentsCell: View {
    var imageName: String = Constants.randomImage
    var title: String = "Some random Title"
    
    var body: some View {
        HStack(
            spacing: 16
        ) {
            ImageLoaderView(
                urlString: imageName
            )
            .frame(
                width: 55,
                height: 55
            )
            
            Text(
                title
            )
            .font(
                AppFonts.headline(
                    16
                )
            )
            .lineLimit(
                2
            )
        }
        .padding(
            .trailing,
            8
        )
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background(
            .appDark
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 6
            )
        )
    }
}

#Preview {
    ZStack {
        Color.appPrimary
            .ignoresSafeArea()
        
        VStack {
            HStack {
                RecentsCell(
                    title: "Random Longer name"
                )
                RecentsCell(
                    title: "Random short"
                )
            }
            HStack {
                RecentsCell(
                    title: "Random Longest name ever"
                )
                RecentsCell()
            }
        }
    }
}
