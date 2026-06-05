//
//  UsersEndpointPath.swift
//  Spookify
//
//  Created by Sylus Abel on 27/05/2026.
//

import Foundation

enum UsersEndpointPath {
    case list
    case byID(Int)
    
    var path: String {
        switch self {
        case .list:
            "users"
        case .byID(let id):
            "users/\(id)"
        }
    }
}
