//
//  CategoryModel.swift
//  Spookify
//
//  Created by Sylus Abel on 25/05/2026.
//

import Foundation

enum Category: String, CaseIterable {
    case all, music, podcasts, audiobooks
}

struct ProductCategory: Codable {
    let slug, name, url: String
}

struct ProductCategories: Codable {
    let categories: [ProductCategory]
}
