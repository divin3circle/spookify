//
//  NewReleaseCell.swift
//  Spookify
//
//  Created by Sylus Abel on 27/05/2026.
//

import SwiftUI

struct NewReleaseCell: View {
    var imageName: String = Constants.randomImage
    var headline: String? = "New Release from"
    var subheadline: String? = "Some Artist"
    var title: String? = "Some Playlist"
    var subtitle: String? = "About playlist"
    
    var body: some View {
        VStack(
            spacing: 16
        ) {
            topSection
            bottomSection
        }
    }
    
    private var topSection: some View {
        HStack(
            spacing: 8
        ) {
            ImageLoaderView(
                urlString: imageName
            )
            .frame(
                width: 50,
                height: 50
            )
            .clipShape(
                Circle()
            )
            
            VStack(
                alignment: .leading,
                spacing: 2
            ) {
                if let headline {
                    Text(
                        headline
                    )
                    .font(
                        AppFonts.headline(
                            16
                        )
                    )
                    .foregroundStyle(
                        .appLight
                    )
                }
                
                if let subheadline {
                    Text(
                        subheadline
                    )
                    .font(
                        AppFonts.title(
                            18
                        )
                    )
                }
            }
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .padding(.horizontal, 16)
    }
    
    private var bottomSection: some View {
        HStack() {
            ImageLoaderView(
                urlString: imageName
            )
            .frame(
                width: 140,
                height: 140
            )
            
            VStack(
                alignment: .leading,
                spacing: 32
            ) {
                VStack(
                    alignment: .leading
                ) {
                    if let title {
                        Text(
                            title
                        )
                        .font(
                            AppFonts.title(
                                16
                            )
                        )
                    }
                    
                    if let subtitle {
                        Text(
                            subtitle
                        )
                        .font(
                            AppFonts.body(14)
                        )
                        .foregroundStyle(
                            .appLight
                        )
                        .lineLimit(2)
                    }
                }
                
                HStack {
                    Image(
                        systemName: "plus.circle"
                    )
                    .foregroundStyle(
                        .appLight
                    )
                    .font(
                        .title3
                    )
                    .onTapGesture {
                        
                    }
                    
                    Spacer()
                    
                    Image(
                        systemName: "play.circle.fill"
                    )
                    .foregroundStyle(
                        .appLight
                    )
                    .font(
                        .title3
                    )
                    .onTapGesture {
                        
                    }
                }
            }
            .padding(.trailing, 16)
        }
        .frame(
            maxWidth: .infinity,
            alignment: .leading
        )
        .background(
            .appDark
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 10
            )
        )
    }
}

#Preview {
    ZStack {
        Color.appPrimary
            .ignoresSafeArea()
        
        NewReleaseCell()
            .padding()
    }
}
