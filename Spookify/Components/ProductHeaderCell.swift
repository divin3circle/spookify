//
//  ProductHeaderCell.swift
//  Spookify
//
//  Created by Sylus Abel on 05/06/2026.
//

import SwiftUI
import SwiftfulUI

struct ProductHeaderCell: View {
    
    var title: String = "Some Title"
    var subtitle: String = "some random subtitle"
    var imageName: String = Constants.randomImage
    var shadowColor: Color = .black.opacity(
        0.8
    )
    var height: CGFloat = 300
    
    var body: some View {
        Rectangle()
            .opacity(
                0
            )
            .overlay {
                ImageLoaderView(
                    urlString: imageName
                )
            }
            .overlay(
                alignment: .bottomLeading,
                content: {
                    VStack(
                        alignment: .leading
                    ) {
                        Text(
                            subtitle
                        )
                        .font(
                            .headline
                        )
                        Text(
                            title
                        )
                        .font(
                            .largeTitle
                        )
                        .bold()
                        .lineLimit(1)
                    }
                    .foregroundStyle(
                        .white
                    )
                    .padding(
                        16
                    )
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    .background(
                        LinearGradient(
                            colors: [
                                shadowColor.opacity(
                                    0
                                ),
                                shadowColor
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                })
            .asStretchyHeader(
                startingHeight: height
            )
    }
}

#Preview {
    ZStack {
        Color.appPrimary
            .ignoresSafeArea()
        
        ScrollView {
            ProductHeaderCell()
        }
        .ignoresSafeArea()
    }
}
