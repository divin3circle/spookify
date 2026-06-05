//
//  ProductsViewModel.swift
//  Spookify
//
//  Created by Sylus Abel on 25/05/2026.
//

import Foundation

@MainActor
@Observable
final class ProductsViewModel {
    var products: Products
    var recentProducts: [Product] = []
    var newRelease: Product?
    var isLoading: Bool = false
    var errorMessage: String?
    
    private let service: ProductServiceProtocol
    
    init(service: ProductServiceProtocol){
        self.service = service
        self.products = Products.empty
    }
    
    func loadProducts() async {
        do {
            self.isLoading = true
            self.products = try await service.getProducts()
            self.isLoading = false
        } catch {
            print("DEBUG: serivce error loading products -> \(error)")
            self.errorMessage = error.localizedDescription
        }
    }
    
    func getRecentProducts() async {
        do {
            self.isLoading = true
            let products = try await service.getProducts()
            recentProducts = Array(products.products.prefix(8))
            self.isLoading = false
        } catch {
            print("DEBUG: serivce error loading products -> \(error)")
            self.errorMessage = error.localizedDescription
        }
    }
    
    func getNewReleaseProduct() async {
        do {
            self.isLoading = true
            let products = try await service.getProducts()
            newRelease = products.products.randomElement()
            self.isLoading = false
        } catch {
            print("DEBUG: service error loading new release -> \(error)")
            self.errorMessage = error.localizedDescription
        }
    }
}
