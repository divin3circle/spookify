//
//  HomeViewModel.swift
//  Spookify
//
//  Created by Sylus Abel on 28/05/2026.
//

import Foundation

@MainActor
@Observable
final class HomeViewModel {
    var recentProducts: [Product] = []
    var currentUser: User?
    var newRelease: Product?
    var rows: [ProductRow] = []
    
    let productService: ProductServiceProtocol
    let userService: UserServiceProtocol
    
    init(productService: ProductServiceProtocol, userService: UserServiceProtocol) {

        self.productService = productService
        self.userService = userService
    }
    
    func getHomeData() async {
        async let userResult = getCurrentUser()
        async let productResult = getProducts()
        
        do {
            let (user, products) = try await (userResult, productResult)
            self.currentUser = user
            self.newRelease = products.products.randomElement()
            self.recentProducts = Array(products.products.prefix(8))
        } catch {
            print("DEBUG: HomeViewModel -> getHomeData \(error)")
        }
        
        do {
            self.rows = try await getProductRows()
        } catch {
            print("DEBUG: HomeViewModel -> getHomeData: rows \(error)")
        }
    }
    
    private func getProductRows() async throws -> [ProductRow] {
        try await productService.getProductRows()
    }
    
    private func getCurrentUser() async throws -> User? {
        try await userService.getCurrentUser(1)
    }
    
    private func getProducts() async throws -> Products{
        try await productService.getProducts()
    }
}
