//
//  ProductDetailView.swift
//  Spookify
//
//  Created by Sylus Abel on 05/06/2026.
//

import SwiftUI
import SwiftfulUI
import SwiftfulRouting

struct ProductDetailView: View {
    @Environment(\.router) var router
    @State var productViewModel = ProductsViewModel(
        service: ProductService()
    )
    @State var showHeader: Bool = true
    
    var product: Product = Product.getRandomProduct()
    
    var body: some View {
        ZStack {
            Color.appPrimary
                .ignoresSafeArea()
            ScrollView(
                .vertical
            ) {
                LazyVStack(
                    spacing: 12
                ) {
                    ProductHeaderCell(
                        title: product.title,
                        subtitle: product.category,
                        imageName: product
                            .getFirstImage(),
                        height: 250
                    )
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150 ? true : false
                    }
                    
                    ProductDescriptionCell(
                        productDescription: product.description,
                        username: "Sylus",
                        subheasline: product.category,
                    )
                    .padding(
                        .horizontal,
                        16
                    )
                    
                    ForEach(
                        productViewModel.products.products
                    ) { product in
                        ProductRowCell(
                            title: product.title,
                            subtitle: product.category,
                            imageName: product
                                .getFirstImage(), onTapRow:  {
                                    navigateToDetailView(product: product)
                                })
                    }
                    .padding(
                        .horizontal,
                        16
                    )
                    
                }
            }
            .scrollIndicators(
                .hidden
            )
            
            ZStack {
                Text(
                    "Macbook Pro"
                )
                .font(
                    .headline
                )
                .padding(
                    .vertical,
                    20
                )
                .frame(
                    maxWidth: .infinity
                )
                .background(
                    .thinMaterial
                )
                .offset(y: showHeader ? 0 : -40)
                .opacity(
                    showHeader ? 1 : 0
                )
                
                Image(
                    systemName: "chevron.left"
                )
                .foregroundStyle(showHeader ? .appSecondary : .white)
                .font(
                    .title3
                )
                .padding(
                    10
                )
                .background(
                    showHeader ? .clear : .appGray
                        .opacity(
                            0.7
                        )
                )
                .clipShape(
                    Circle()
                )
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(
                    .leading,
                    16
                )
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
                
            }
            .foregroundStyle(
                .appSecondary
            )
            .animation(.smooth, value: showHeader)
            .frame(
                maxHeight: .infinity,
                alignment: .top
            )
        }
        .navigationBarBackButtonHidden(true)
        .task {
            await productViewModel
                .loadProducts()
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
}

#Preview {
    ZStack {
        Color.appPrimary
            .ignoresSafeArea()
        ProductDetailView()
    }
}
