//
//  CategoryCell.swift
//  Spookify
//
//  Created by Sylus Abel on 25/05/2026.
//

import SwiftUI

struct CategoryCell: View {
    var title = "Music"
    var isSelected: Bool = false
    
    var body: some View {
        Text(
            title
        )
        .font(
            AppFonts.body()
        )
        .frame(
            minWidth: 40
        )
        .padding(
            .vertical,
            8
        )
        .padding(
            .horizontal,
            10
        )
        .themeColors(
            isSelected: isSelected
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 20
            )
        )
    }
}

extension View {
    func themeColors(
        isSelected: Bool
    ) -> some View {
        self
            .background(
                isSelected ? .accent : .appDark
            )
            .foregroundStyle(
                isSelected ? .appDark : .appSecondary
            )
    }
}

#Preview {
    ZStack {
        Color.appPrimary
            .ignoresSafeArea()
        
        VStack(
            spacing: 40
        ) {
            CategoryCell(
                title: "Title One",
                isSelected: false
            )
            CategoryCell(
                title: "OneLined",
                isSelected: true
            )
            CategoryCell(
                title: "Title Three",
                isSelected: false
            )
        }
    }
}
