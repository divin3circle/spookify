//
//  ProductsEndpointPath.swift
//  Spookify
//
//  Created by Sylus Abel on 27/05/2026.
//

import Foundation

enum ProductsEndpointPath {
    case list
    case byID(
        Int
    )
    case byCategory(String)
    case categories
    
    var path: String {
        switch self {
        case .list:
            "products"
        case .byID(
            let id
        ):
            "products/\(id)"
        case .byCategory(let category):
            "products/category/\(category)"
        case .categories:
            "products/categories"
        }
    }
}
