//
//  APIRoutes.swift
//  Spookify
//
//  Created by Sylus Abel on 27/05/2026.
//

import Foundation

enum APIRoutes {
    case users(UsersEndpointPath)
    case products(ProductsEndpointPath)
    
    var path: String {
        switch self {
        case .users(let userRoute):
            userRoute.path
        case .products(let productRoute):
            productRoute.path
        }
    }
}
