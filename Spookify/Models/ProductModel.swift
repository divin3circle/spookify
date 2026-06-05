//
//  ProductModel.swift
//  Spookify
//
//  Created by Sylus Abel on 25/05/2026.
//

import Foundation

struct Products: Codable {
    let products: [Product]
    let total, skip, limit: Int
    
    static let empty = Products(products: [], total: 0, skip: 0, limit: 0)
}

struct Product: Codable, Identifiable {
    let id: Int
    let title, description, category: String
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand, sku: String?
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation, availabilityStatus: String
    let reviews: [Review]
    let returnPolicy: String
    let minimumOrderQuantity: Int
    let meta: Meta
    let thumbnail: String
    let images: [String]
}

struct Dimensions: Codable {
    let width, height, depth: Double
}

struct Meta: Codable {
    let createdAt, updatedAt, barcode, qrCode: String
}

struct Review: Codable {
    let rating: Int
    let comment, date, reviewerName, reviewerEmail: String
}

extension Product {
    func getFirstImage() -> String {
        self.images.first ?? Constants.randomImage
    }
    
    static func getRandomProduct() -> Product {
        Product(
            id: 69,
            title: "Apple Macbook Pro",
            description: "Apple M5 16GB 512GB. The current MacBook Pro lineup features blazing-fast, power-efficient M-series chips (ranging from the M4 to the M5 series), stunning Liquid Retina XDR displays, and up to 24 hours of battery life",
            category: "Computers",
            price: 1299.99,
            discountPercentage: 5.6,
            rating: 4.2,
            stock: 200,
            tags: ["apple", "m5", "laptop"],
            brand: "Apple",
            sku: "APPLE-MBP-M5-512",
            weight: 2400,
            dimensions: Dimensions(width: 14, height: 4, depth: 4),
            warrantyInformation: "Available",
            shippingInformation: "Shipping from San Francisco, CA",
            availabilityStatus: "Available",
            reviews: [
                Review(
                    rating: 4,
                    comment: "very good",
                    date: "2025-12-12",
                    reviewerName: "Sylus",
                    reviewerEmail: "sylusabel1@gmail.com"
                )
            ],
            returnPolicy: "Refundable",
            minimumOrderQuantity: 1,
            meta: Meta(
                createdAt: "2024-12-12",
                updatedAt: "2024-12-12",
                barcode: "OPRHYSUAH",
                qrCode: "KIALSERFV5"
            ),
            thumbnail: "https://picsum.photos/200",
            images: ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdwEgFAlCBe1ljqfIWxZDzKBloK7W-Mr7VZQ&s"]
        )
    }
}

struct ProductRow: Identifiable {
    let id: String
    let title: String
    let products: Products
}
