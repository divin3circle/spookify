//
//  ProductService.swift
//  Spookify
//
//  Created by Sylus Abel on 25/05/2026.
//

import Foundation

protocol ProductServiceProtocol {
    func getProducts() async throws -> Products
    func getProductRows() async throws -> [ProductRow]
}

struct ProductService: ProductServiceProtocol {
    private let baseURL = "https://dummyjson.com"
    
    func getProducts() async throws -> Products {
      let requestModel = APIRequest<Products>(
            method: .get,
            path: .products(.list),
            body: nil
        )
        return try await execute(requestModel)
    }
    
    func getProductRows() async throws -> [ProductRow] {
        let requestModel = APIRequest<[ProductCategory]>(
            method: .get,
            path: .products(.categories),
            body: nil
        )

        let categories = try await execute(requestModel)

        let indexedRows = try await withThrowingTaskGroup(
            of: (index: Int, row: ProductRow).self
        ) { group in
            for (index, category) in categories.enumerated() {
                group.addTask {
                    let products = try await getProductsByCategory(category.slug)

                    let row = ProductRow(
                        id: category.slug,
                        title: category.name,
                        products: products
                    )

                    return (index, row)
                }
            }

            var indexedRows: [(index: Int, row: ProductRow)] = []

            for try await result in group {
                indexedRows.append(result)
            }

            return indexedRows
        }

        return indexedRows
            .sorted { $0.index < $1.index }
            .map(\.row)
    }
    
    func getProductsByCategory(_ category: String) async throws -> Products {
        let requestModel = APIRequest<Products>(
            method: .get, path: .products(.byCategory(category)), body: nil
        )
        return try await execute(requestModel)
    }
    
    func execute<Response>(_ requestModel: APIRequest<Response>) async throws -> Response {
        guard let url = URL(
            string: baseURL
        ) else {
            throw URLError(
                .badURL
            )
        }
        
        let request = try requestModel.makeURLRequest(
            baseURL: url
        )
        
        
        let (
            data,
            response
        ) = try await URLSession.shared.data(
            for: request
        )
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(
                .badServerResponse
            )
        }
        
        print(
            "DEBUG: response from API -> \(httpResponse.statusCode) \(requestModel.path.path)"
        )
        
        let products = try JSONDecoder().decode(
            Response.self,
            from: data
        )
            
        return products
    }
}




