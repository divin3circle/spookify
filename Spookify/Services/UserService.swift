//
//  UserService.swift
//  Spookify
//
//  Created by Sylus Abel on 25/05/2026.
//

import Foundation

protocol UserServiceProtocol {
    func getUsers() async throws -> Users
    func getCurrentUser(_ id: Int) async throws -> User
}

struct UserService: UserServiceProtocol {
    private let baseURL = "https://dummyjson.com"
    
    func getUsers() async throws -> Users {
        let requestModel = APIRequest<Users>(method: .get, path: .users(.list), body: nil)
        return try await execute(requestModel)
    }
    
    func getCurrentUser(_ id: Int = 1) async throws -> User {
        let requestModel = APIRequest<User>(method: .get, path: .users(.byID(id)), body: nil)
        return try await execute(requestModel)
    }
    
    private func execute<Response>(_ requestModel: APIRequest<Response>) async throws -> Response {
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        let request = try requestModel.makeURLRequest(baseURL: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        print("DEBUG: users http response \(httpResponse.statusCode)")
        
        return try JSONDecoder().decode(Response.self, from: data)
        
    }
}
