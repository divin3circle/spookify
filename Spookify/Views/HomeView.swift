//
//  HomeView.swift
//  Spookify
//
//  Created by Sylus Abel on 25/05/2026.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct HomeView: View {
    @Environment(
        \.router
    ) var router
    
    @State private var homeViewModel = HomeViewModel(
        productService: ProductService(),
        userService: UserService()
    )
    
    @State private var selectedCategory: Category? = nil
    
    
    var body: some View {
        ZStack{
            Color.appPrimary
                .ignoresSafeArea()
            
            ScrollView(
                .vertical
            ) {
                LazyVStack(
                    spacing: 10,
                    pinnedViews: [.sectionHeaders]
                ) {
                    Section {
                        VStack(
                            spacing: 20
                        ) {
                            recents
                                .padding(
                                    .horizontal,
                                    16
                                )
                            
                            if let newRelease = homeViewModel.newRelease {
                                newReleaseSection(
                                    product: newRelease
                                )
                                .padding(.horizontal, 16)
                            }
                            
                            ForEach(
                                homeViewModel.rows
                            ) { row in
                                productRowItem(
                                    productRow: row
                                )
                                
                            }
                        }
                    } header: {
                        header
                    }
                }
                .padding(
                    .top,
                    8
                )
            }
            .scrollIndicators(
                .hidden
            )
            .ignoresSafeArea(
                .container,
                edges: .bottom
            )
            .mask {
                GeometryReader { geo in
                    Rectangle()
                        .frame(
                            width: geo.size.width,
                            height: geo.size.height + geo.safeAreaInsets.bottom
                        )
                        .offset(
                            y: 0
                        )
                }
            }
        }
        .task {
            await homeViewModel
                .getHomeData()
        }
        .toolbar(
            .hidden,
            for: .navigationBar
        )
    }
    
    private var header: some View {
        HStack(
            spacing: 0
        ) {
            ZStack {
                if let currentUser = homeViewModel.currentUser {
                    ImageLoaderView(
                        urlString: currentUser.image
                    )
                    .background(
                        .appGray
                    )
                    .clipShape(
                        Circle()
                    )
                    .onTapGesture {
                        print(
                            "go to profile"
                        )
                    }
                }
            }
            .frame(
                width: 35,
                height: 35
            )
            ScrollView(
                .horizontal
            ) {
                HStack(
                    spacing: 8
                ) {
                    ForEach(
                        Category.allCases,
                        id: \.self
                    ) { category in
                        CategoryCell(
                            title: category.rawValue.capitalized,
                            isSelected: selectedCategory == category
                        )
                        .onTapGesture {
                            selectedCategory = category
                        }
                    }
                }
                .padding(
                    .horizontal,
                    16
                )
            }
            .scrollIndicators(
                .hidden
            )
        }
        .padding(
            .vertical,
            24
        )
        .padding(
            .leading,
            8
        )
        .background(
            .appPrimary
        )
    }
    
    private var recents: some View {
        NonLazyVGrid(
            columns: 2,
            alignment: .center,
            spacing: 10,
            items: homeViewModel.recentProducts
        ) { product in
            if let product {
                RecentsCell(
                    imageName: product
                        .getFirstImage(),
                    title: product.title
                )
                .asButton(
                    .press
                ) {
                    navigateToDetailView(
                        product: product
                    )
                }
            }
        }
    }
    
    private func navigateToDetailView(
        product: Product
    ) {
        router
            .showScreen(
                .push
            ) { _ in
                ProductDetailView(
                    product: product
                )
            }
    }
    
    private func newReleaseSection(
        product newRelease: Product
    ) -> some View {
        NewReleaseCell(
            imageName: newRelease
                .getFirstImage(),
            headline: newRelease.brand,
            subheadline: newRelease.category,
            title: newRelease.title,
            subtitle: newRelease.description
        )
    }
    
    private func productRowItem(
        productRow row: ProductRow
    ) -> some View {
        VStack(
            alignment: .leading,
            spacing: 8
        ) {
            Text(
                row.title
            )
            .font(
                AppFonts.headline()
            )
            .padding(
                .horizontal,
                16
            )
            
            ScrollView(
                .horizontal
            ) {
                HStack(
                    spacing: 8
                ) {
                    ForEach(
                        row.products.products
                    ) { item in
                        ItemCell(
                            imageName: item.getFirstImage(),
                            title: item.title
                        )
                        .asButton(
                            .press
                        ) {
                            navigateToDetailView(product: item)
                        }
                    }
                }
                .padding(
                    .horizontal,
                    16
                )
            }
            .scrollIndicators(
                .hidden
            )
        }
    }
}
    

#Preview {
    RouterView { _ in
        HomeView()
    }
}
