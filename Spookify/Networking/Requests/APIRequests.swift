//
//  APIRequests.swift
//  Spookify
//
//  Created by Sylus Abel on 26/05/2026.
//

import Foundation

enum HTTPRequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

struct APIRequest<Response: Decodable> {
    let method: HTTPRequestMethod
    let path: APIRoutes
    var queryItems: [URLQueryItem]
    var headers: [String: String]
    let body: Data?
    
    init(
        method: HTTPRequestMethod,
        path: APIRoutes,
        queryItems: [URLQueryItem] = [],
        headers: [String : String] = [:],
        body: Data?
    ) {
        self.method = method
        self.path = path
        self.headers = headers
        self.body = body
        self.queryItems = queryItems
    }
    
    init<Body: Encodable>(
        method: HTTPRequestMethod,
        path: APIRoutes,
        queryItems: [URLQueryItem] = [],
        headers: [String: String] = [:],
        encoder: JSONEncoder = JSONEncoder(),
        body: Body
    ) throws {
        self.method = method
        self.path = path
        self.headers = headers
        self.body = try encoder
            .encode(
                body
            )
        self.queryItems = queryItems
        
        if self.headers["Content-Type"] == nil {
            self.headers["Content-Type"] = "application/json"
        }
    }
    
    func makeURLRequest(
        baseURL: URL,
        defaultHeaders: [String: String] = [:]
    ) throws -> URLRequest {
        guard var components = URLComponents(
            url: baseURL
                .appending(
                    path: path.path
                ),
            resolvingAgainstBaseURL: true
        ) else {
            throw URLError(
                .badURL
            )
        }
        
        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        
        guard let url = components.url else {
            throw URLError(
                .badURL
            )
        }
        
        var request = URLRequest(
            url: url
        )
        request.httpMethod = method.rawValue
        
        var mergedHeaders = defaultHeaders
        mergedHeaders
            .merge(
                headers
            ) {
                _,
                new in
            new
        }
        request.allHTTPHeaderFields = mergedHeaders
        
        request.httpBody = body
        
        return request
    }
}
